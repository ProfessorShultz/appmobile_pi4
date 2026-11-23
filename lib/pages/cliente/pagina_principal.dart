import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class PortalClinicaPage extends StatefulWidget {
  const PortalClinicaPage({super.key});

  @override
  State<PortalClinicaPage> createState() => _PortalClinicaPageState();
}

class _PortalClinicaPageState extends State<PortalClinicaPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.portalBgDark,
      body: SafeArea(
        child: SingleChildScrollView(
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
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
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
                    showDot: true,
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
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
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
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'PEDIDOS EM PROCESSAMENTO',
                            style: TextStyle(
                              color: AppColors.portalGold,
                              fontSize: 11,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 1.1,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            '2',
                            style: TextStyle(
                              color: AppColors.portalGold,
                              fontSize: 42,
                              fontWeight: FontWeight.bold,
                              height: 1.0,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
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
                      onTap: () {
                        // TODO: navegar para criartrabalho.dart
                      },
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
                      setState(() => _currentIndex = 2); // Vai para aba Pedidos
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

              const _PedidoAtivoCard(
                codigoTipo: '#PT-2026-184 • Digital',
                paciente: 'Mariana Lopes',
                trabalho: 'Coroa Dissilicato',
                estado: 'EM PROCESSAMENTO',
                icon: Icons.description_outlined,
              ),
              const SizedBox(height: 12),
              const _PedidoAtivoCard(
                codigoTipo: '#PT-2026-179 • Físico',
                paciente: 'João Ferreira',
                trabalho: 'Prótese Acrílica',
                estado: 'EM PROCESSAMENTO',
                icon: Icons.view_in_ar_outlined,
              ),
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

              const _AtualizacaoItem(
                icon: Icons.camera_alt_outlined,
                titulo: 'Novas fotografias de prova',
                descricao: 'O laboratório partilhou conteúdo no pedido #PT-2026-184.',
                tempo: 'Há 12 min',
                naoLida: true,
              ),
              const Divider(color: AppColors.portalBorderLight, height: 24),
              const _AtualizacaoItem(
                icon: Icons.chat_bubble_outline,
                titulo: 'Nota do laboratório',
                descricao: '“Solicitamos validação da tonalidade antes de avançar.”',
                tempo: 'Ontem, 16:38',
                naoLida: true,
              ),
            ],
          ),
        ),
      ),

      // Barra inferior limpa com 5 itens alinhados na mesma linha
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          if (index == 1) {
            // TODO: abrir criartrabalho.dart
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

  const _PedidoAtivoCard({
    required this.codigoTipo,
    required this.paciente,
    required this.trabalho,
    required this.estado,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
          const Icon(
            Icons.chevron_right,
            color: AppColors.portalTextMuted,
          ),
        ],
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