import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../route_names.dart';
import '../services/auth_api.dart';
import '../theme/app_colors.dart';

// 1. Modelos de dados alinhados com os widgets da página
class PedidoAtivo {
  final String id;
  final String codigoTipo;
  final String paciente;
  final String trabalho;
  final String estado;
  final IconData icon;

  const PedidoAtivo({
    required this.id,
    required this.codigoTipo,
    required this.paciente,
    required this.trabalho,
    required this.estado,
    required this.icon,
  });
}

class AtualizacaoRecente {
  final String titulo;
  final String descricao;
  final String tempo;
  final IconData icon;
  final bool naoLida;

  const AtualizacaoRecente({
    required this.titulo,
    required this.descricao,
    required this.tempo,
    required this.icon,
    this.naoLida = false,
  });
}

class ClinicaRepository {
  ClinicaRepository({http.Client? client, Uri? baseUri})
    : _client = client ?? http.Client(),
      _baseUri = _withTrailingSlash(
        baseUri ??
            Uri.parse(
              const String.fromEnvironment(
                'API_BASE_URL',
                defaultValue: 'http://127.0.0.1:8000/api/v1/',
              ),
            ),
      );

  final http.Client _client;
  final Uri _baseUri;

  static const _requestTimeout = Duration(seconds: 15);

  Future<List<PedidoAtivo>> obterPedidosAtivos() async {
    final items = await _getList('pedidos/');
    return items.map((json) {
      final codigo = json['codigo'] ?? json['id'] ?? '';
      final fluxo = (json['fluxo'] ?? json['modalidade'] ?? '').toString();
      final isDigital = fluxo.toLowerCase().contains('digital');

      return PedidoAtivo(
        id: '${json['id'] ?? ''}',
        codigoTipo: fluxo.isNotEmpty ? '$codigo • $fluxo' : '$codigo',
        paciente: (json['paciente_nome'] ?? json['paciente'] ?? '').toString(),
        trabalho: (json['tipo_trabalho'] ?? json['trabalho'] ?? '').toString(),
        estado: (json['estado'] ?? 'EM PROCESSAMENTO').toString().toUpperCase(),
        icon: isDigital
            ? Icons.description_outlined
            : Icons.view_in_ar_outlined,
      );
    }).toList();
  }

  Future<List<AtualizacaoRecente>> obterAtualizacoesRecentes() async {
    final items = await _getList('atualizacoes/');
    return items.map((json) {
      final tipo = (json['tipo'] ?? '').toString().toLowerCase();
      final isFoto = tipo.contains('foto') || tipo.contains('prova');

      return AtualizacaoRecente(
        titulo: (json['titulo'] ?? '').toString(),
        descricao: (json['descricao'] ?? json['mensagem'] ?? '').toString(),
        tempo: (json['tempo'] ?? json['criado_em'] ?? '').toString(),
        icon: isFoto ? Icons.camera_alt_outlined : Icons.chat_bubble_outline,
        naoLida: json['nao_lida'] == true || json['lida'] == false,
      );
    }).toList();
  }

  Future<List<Map<String, dynamic>>> _getList(String path) async {
    final token = AuthApi.currentSession?.accessToken;
    if (token == null || token.isEmpty) {
      throw const AuthApiException(
        'Não existe uma sessão autenticada para carregar estes dados.',
      );
    }

    final http.Response response;
    try {
      response = await _client
          .get(
            _baseUri.resolve(path),
            headers: {
              'Accept': 'application/json',
              'Authorization': 'Bearer $token',
            },
          )
          .timeout(_requestTimeout);
    } on TimeoutException {
      throw const AuthApiException('A ligação à API excedeu o tempo limite.');
    } on http.ClientException {
      throw const AuthApiException(
        'Não foi possível contactar a API. Confirma se o backend está ativo.',
      );
    }

    final Object? decoded;
    try {
      decoded = jsonDecode(response.body);
    } on FormatException {
      throw const AuthApiException('A API devolveu uma resposta inválida.');
    }

    if (response.statusCode < 200 || response.statusCode >= 300) {
      final detail = decoded is Map<String, dynamic> ? decoded['detail'] : null;
      throw AuthApiException(
        detail is String
            ? detail
            : 'A API recusou o pedido (${response.statusCode}).',
      );
    }

    final List<dynamic> items;
    if (decoded is List) {
      items = decoded;
    } else if (decoded is Map<String, dynamic> && decoded['results'] is List) {
      items = decoded['results'] as List;
    } else {
      throw const AuthApiException('A API devolveu uma lista inválida.');
    }

    return items.map((item) {
      if (item is! Map<String, dynamic>) {
        throw const AuthApiException(
          'A API devolveu um item com formato inválido.',
        );
      }
      return item;
    }).toList();
  }

  static Uri _withTrailingSlash(Uri uri) {
    if (uri.path.endsWith('/')) {
      return uri;
    }
    return uri.replace(path: '${uri.path}/');
  }
}

class PaginaClinicaPage extends StatefulWidget {
  const PaginaClinicaPage({super.key});

  @override
  State<PaginaClinicaPage> createState() => _PaginaClinicaPageState();
}

class _PaginaClinicaPageState extends State<PaginaClinicaPage> {
  final ClinicaRepository _repository = ClinicaRepository();

  int _currentIndex = 0;
  bool _isLoading = true;
  String? _erroMensagem;

  List<PedidoAtivo> _pedidosAtivos = [];
  List<AtualizacaoRecente> _atualizacoes = [];

  @override
  void initState() {
    super.initState();
    _carregarDados();
  }

  Future<void> _carregarDados() async {
    setState(() {
      _isLoading = true;
      _erroMensagem = null;
    });

    try {
      final resultados = await Future.wait([
        _repository.obterPedidosAtivos(),
        _repository.obterAtualizacoesRecentes(),
      ]);

      if (!mounted) return;
      setState(() {
        _pedidosAtivos = resultados[0] as List<PedidoAtivo>;
        _atualizacoes = resultados[1] as List<AtualizacaoRecente>;
        _isLoading = false;
      });
    } on AuthApiException catch (error) {
      if (!mounted) return;
      setState(() {
        _erroMensagem = error.message;
        _isLoading = false;
      });
    } catch (error) {
      if (!mounted) return;
      setState(() {
        _erroMensagem = 'Erro inesperado ao carregar dados: $error';
        _isLoading = false;
      });
    }
  }

  int get _totalEmProcessamento => _pedidosAtivos
      .where((p) => p.estado.toUpperCase() == 'EM PROCESSAMENTO')
      .length;

  Future<void> _abrirNovoPedido() async {
    await Navigator.of(context).pushNamed(AppRouteNames.clientNewOrderPath);
    if (mounted) {
      await _carregarDados();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.portalBgDark,
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: _carregarDados,
          color: AppColors.portalGold,
          backgroundColor: AppColors.portalSurfaceDark,
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Cabeçalho académico / contexto
                const Center(
                  child: Text(
                    'ESTGV • TECNOLOGIAS E DESIGN DE MULTIMÉDIA — PI4',
                    style: TextStyle(
                      color: AppColors.portalTextMuted,
                      fontSize: 10,
                      letterSpacing: 1.2,
                    ),
                  ),
                ),
                const SizedBox(height: 14),

                // Top bar: Logo + Badge role + Sino + Logout
                Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: AppColors.portalSurfaceDark,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: AppColors.portalBorderSubtle),
                      ),
                      child: const Icon(
                        Icons.medical_services_outlined,
                        color: AppColors.portalGold,
                      ),
                    ),
                    const Spacer(),
                    Flexible(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.portalRoleBackground,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: AppColors.portalCyan.withValues(alpha: 0.4),
                          ),
                        ),
                        child: const Text(
                          'MÉDICA DENTISTA',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: AppColors.portalCyan,
                            fontSize: 11,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.6,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    _IconActionButton(
                      icon: Icons.notifications_none,
                      showDot: _atualizacoes.any((a) => a.naoLida),
                      onTap: () {
                        // TODO: navegar para notificações
                      },
                    ),
                    const SizedBox(width: 8),
                    _IconActionButton(
                      icon: Icons.logout,
                      onTap: () {
                        // TODO: logout / voltar para login_screen.dart
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 14),

                // Barra de sessão autorizada
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.portalSurfaceDark,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: AppColors.portalBorderFaint),
                  ),
                  child: const Row(
                    children: [
                      Icon(
                        Icons.lock_outline,
                        size: 15,
                        color: AppColors.portalTextMuted,
                      ),
                      SizedBox(width: 8),
                      Text(
                        'Sessão autorizada',
                        style: TextStyle(
                          color: AppColors.portalTextMuted,
                          fontSize: 12,
                        ),
                      ),
                      Spacer(),
                      Text(
                        'Dra. Inês Matos',
                        style: TextStyle(
                          color: AppColors.portalTextPrimary,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 22),

                // Saudação + Avatar iniciais
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'PORTAL DA CLÍNICA',
                            style: TextStyle(
                              color: AppColors.portalGold,
                              fontSize: 11,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 1.4,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Bom dia, Dra. Inês',
                            style: TextStyle(
                              color: AppColors.portalTextPrimary,
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Acompanhe a produção sem telefonemas.',
                            style: TextStyle(
                              color: AppColors.portalTextMuted,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 12),
                    Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.portalAvatarBackground,
                        border: Border.all(
                          color: AppColors.portalGold.withValues(alpha: 0.5),
                        ),
                      ),
                      alignment: Alignment.center,
                      child: const Text(
                        'IM',
                        style: TextStyle(
                          color: AppColors.portalGold,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // Card principal: Pedidos em processamento + Botão Novo pedido
                Container(
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: AppColors.portalCardDark,
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(color: AppColors.portalBorderSubtle),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'PEDIDOS EM PROCESSAMENTO',
                              style: TextStyle(
                                color: AppColors.portalGold,
                                fontSize: 11,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 1.1,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              _isLoading ? '...' : '$_totalEmProcessamento',
                              style: const TextStyle(
                                color: AppColors.portalGold,
                                fontSize: 42,
                                fontWeight: FontWeight.bold,
                                height: 1.0,
                              ),
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              'Modo simplificado para acompanhamento',
                              style: TextStyle(
                                color: AppColors.portalTextMuted,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 14),
                      InkWell(
                        onTap: _abrirNovoPedido,
                        borderRadius: BorderRadius.circular(16),
                        child: Container(
                          width: 104,
                          height: 104,
                          decoration: BoxDecoration(
                            color: AppColors.portalGold,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.add,
                                color: AppColors.portalTextOnAccent,
                                size: 26,
                              ),
                              SizedBox(height: 6),
                              Text(
                                'Novo pedido',
                                style: TextStyle(
                                  color: AppColors.portalTextOnAccent,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),

                // Secção: Pedidos ativos
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Pedidos ativos',
                      style: TextStyle(
                        color: AppColors.portalTextPrimary,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(
                          () => _currentIndex = 2,
                        ); // Vai para aba Pedidos
                      },
                      child: const Text(
                        'Ver todos',
                        style: TextStyle(
                          color: AppColors.portalGold,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),

                if (_isLoading)
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Center(
                      child: CircularProgressIndicator(
                        color: AppColors.portalGold,
                      ),
                    ),
                  )
                else if (_erroMensagem != null)
                  _ErroCard(mensagem: _erroMensagem!, onRetry: _carregarDados)
                else if (_pedidosAtivos.isEmpty)
                  const Text(
                    'Sem pedidos ativos de momento.',
                    style: TextStyle(color: AppColors.portalTextMuted),
                  )
                else
                  ...List.generate(_pedidosAtivos.length, (index) {
                    final pedido = _pedidosAtivos[index];
                    return Padding(
                      padding: EdgeInsets.only(
                        bottom: index < _pedidosAtivos.length - 1 ? 12 : 0,
                      ),
                      child: _PedidoAtivoCard(
                        codigoTipo: pedido.codigoTipo,
                        paciente: pedido.paciente,
                        trabalho: pedido.trabalho,
                        estado: pedido.estado,
                        icon: pedido.icon,
                        onTap: () {
                          // TODO: abrir detalhe do pedido pedido.id
                        },
                      ),
                    );
                  }),

                const SizedBox(height: 24),

                // Secção: Atualizações recentes
                const Text(
                  'Atualizações recentes',
                  style: TextStyle(
                    color: AppColors.portalTextPrimary,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),

                if (_isLoading)
                  const SizedBox.shrink()
                else if (_atualizacoes.isEmpty)
                  const Text(
                    'Sem atualizações recentes.',
                    style: TextStyle(color: AppColors.portalTextMuted),
                  )
                else
                  ...List.generate(_atualizacoes.length, (index) {
                    final item = _atualizacoes[index];
                    return Column(
                      children: [
                        _AtualizacaoItem(
                          icon: item.icon,
                          titulo: item.titulo,
                          descricao: item.descricao,
                          tempo: item.tempo,
                          naoLida: item.naoLida,
                        ),
                        if (index < _atualizacoes.length - 1)
                          const Divider(
                            color: AppColors.portalBorderLight,
                            height: 24,
                          ),
                      ],
                    );
                  }),
              ],
            ),
          ),
        ),
      ),

      // Barra inferior limpa com 5 itens alinhados na mesma linha
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) async {
          if (index == 1) {
            await _abrirNovoPedido();
            return;
          }
          setState(() => _currentIndex = index);
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.portalSurfaceDark,
        selectedItemColor: AppColors.portalGold,
        unselectedItemColor: AppColors.portalTextMuted,
        selectedFontSize: 11,
        unselectedFontSize: 11,
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Início',
          ),
          BottomNavigationBarItem(
            icon: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppColors.portalGold,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(
                Icons.add,
                color: AppColors.portalTextOnAccent,
                size: 20,
              ),
            ),
            label: 'Novo',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.receipt_long_outlined),
            label: 'Pedidos',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outline),
            label: 'Mensagens',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }
}

class _ErroCard extends StatelessWidget {
  final String mensagem;
  final VoidCallback onRetry;

  const _ErroCard({required this.mensagem, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.portalSurfaceDark,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.portalBorderLight),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              mensagem,
              style: TextStyle(color: AppColors.portalTextMuted, fontSize: 12),
            ),
          ),
          const SizedBox(width: 10),
          TextButton(
            onPressed: onRetry,
            child: const Text(
              'Tentar novamente',
              style: TextStyle(color: AppColors.portalGold),
            ),
          ),
        ],
      ),
    );
  }
}

class _IconActionButton extends StatelessWidget {
  final IconData icon;
  final bool showDot;
  final VoidCallback onTap;

  const _IconActionButton({
    required this.icon,
    this.showDot = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: 38,
            height: 38,
            decoration: BoxDecoration(
              color: AppColors.portalSurfaceDark,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppColors.portalBorderLight),
            ),
            child: Icon(icon, color: AppColors.portalTextSecondary, size: 20),
          ),
          if (showDot)
            Positioned(
              top: 6,
              right: 7,
              child: Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: AppColors.portalCyan,
                  shape: BoxShape.circle,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _PedidoAtivoCard extends StatelessWidget {
  final String codigoTipo;
  final String paciente;
  final String trabalho;
  final String estado;
  final IconData icon;
  final VoidCallback? onTap;

  const _PedidoAtivoCard({
    required this.codigoTipo,
    required this.paciente,
    required this.trabalho,
    required this.estado,
    required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: AppColors.portalSurfaceDark,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.portalBorderLight),
        ),
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: AppColors.portalRoleBackground,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: AppColors.portalCyan),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    codigoTipo,
                    style: const TextStyle(
                      color: AppColors.portalTextMuted,
                      fontSize: 11,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    paciente,
                    style: const TextStyle(
                      color: AppColors.portalTextPrimary,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    trabalho,
                    style: const TextStyle(
                      color: AppColors.portalTextMuted,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                color: AppColors.portalRoleBackground,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: AppColors.portalCyan.withValues(alpha: 0.4),
                ),
              ),
              child: Text(
                estado,
                style: const TextStyle(
                  color: AppColors.portalCyan,
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const SizedBox(width: 6),
            const Icon(Icons.chevron_right, color: AppColors.portalTextMuted),
          ],
        ),
      ),
    );
  }
}

class _AtualizacaoItem extends StatelessWidget {
  final IconData icon;
  final String titulo;
  final String descricao;
  final String tempo;
  final bool naoLida;

  const _AtualizacaoItem({
    required this.icon,
    required this.titulo,
    required this.descricao,
    required this.tempo,
    this.naoLida = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: AppColors.portalUpdateBackground,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: AppColors.portalCyan, size: 22),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                titulo,
                style: const TextStyle(
                  color: AppColors.portalTextPrimary,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                descricao,
                style: const TextStyle(
                  color: AppColors.portalDescriptionText,
                  fontSize: 13,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                tempo,
                style: const TextStyle(
                  color: AppColors.portalTimestampText,
                  fontSize: 11,
                ),
              ),
            ],
          ),
        ),
        if (naoLida)
          Container(
            margin: const EdgeInsets.only(top: 4, left: 8),
            width: 8,
            height: 8,
            decoration: const BoxDecoration(
              color: AppColors.portalCyan,
              shape: BoxShape.circle,
            ),
          ),
      ],
    );
  }
}
