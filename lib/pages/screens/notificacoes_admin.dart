import 'package:material_ui/material_ui.dart';

class NotificacoesAdminPage extends StatelessWidget {
  const NotificacoesAdminPage({super.key});

  // Paleta de cores oficial do projeto
  static const Color bgDark = Color(0xFF0D0D0D);
  static const Color cardDark = Color(0xFF161618);
  static const Color borderDark = Color(0xFF262629);
  static const Color goldPrimary = Color(0xFFD4AF37);
  static const Color goldLight = Color(0xFFF3D06B);
  static const Color textGrey = Color(0xFF8E8E93);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgDark,
      body: SafeArea(
        child: Column(
          children: [
            _buildTopHeader(context),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(16, 20, 16, 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildPageHeader(),
                    const SizedBox(height: 20),
                    _buildMarcarLidasButton(),
                    const SizedBox(height: 24),
                    _buildNotificacoesListSection(context),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Cabeçalho superior fixo institucional com botão de voltar/fechar
  Widget _buildTopHeader(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: bgDark,
        border: Border(bottom: BorderSide(color: borderDark, width: 1)),
      ),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 6),
            color: const Color(0xFF121214),
            child: const Text(
              'ESTGV  •  TECNOLOGIAS E DESIGN DE MULTIMÉDIA — PI4',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: textGrey,
                fontSize: 9,
                letterSpacing: 1.2,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
            child: Row(
              children: [
                // Botão de voltar ao ecrã anterior
                Container(
                  decoration: BoxDecoration(
                    color: cardDark,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: borderDark),
                  ),
                  child: IconButton(
                    icon: const Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.white,
                      size: 16,
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
                const SizedBox(width: 12),
                Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [goldLight, goldPrimary],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Center(
                    child: Text(
                      'D',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w900,
                        fontSize: 22,
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    color: goldPrimary.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: goldPrimary.withValues(alpha: 0.5),
                    ),
                  ),
                  child: const Text(
                    'ADMINISTRAD',
                    style: TextStyle(
                      color: goldPrimary,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.8,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 4, 16, 12),
            child: Row(
              children: const [
                Icon(Icons.lock_outline, size: 13, color: textGrey),
                SizedBox(width: 6),
                Text(
                  'Sessão autorizada',
                  style: TextStyle(color: textGrey, fontSize: 11),
                ),
                Spacer(),
                Text(
                  'Catarina Domingos',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Título da Página de Notificações[cite: 8]
  Widget _buildPageHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'Atividade do laboratório',
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 4),
        Text(
          'Notificações geradas automaticamente pelas alterações aos trabalhos.',
          style: TextStyle(color: textGrey, fontSize: 12),
        ),
      ],
    );
  }

  /// Botão "Marcar todas como lidas"[cite: 8]
  Widget _buildMarcarLidasButton() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: cardDark,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: borderDark),
      ),
      child: TextButton.icon(
        onPressed: () {
          // TODO: Marcar todas as notificações como lidas
        },
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        icon: const Icon(Icons.check, color: Colors.white, size: 18),
        label: const Text(
          'Marcar todas como lidas',
          style: TextStyle(
            color: Colors.white,
            fontSize: 13,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  /// Secção da Lista de Notificações[cite: 8]
  Widget _buildNotificacoesListSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Atualizações recentes',
          style: TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        const Text(
          '6 por ler • 6 notificações sincronizadas',
          style: TextStyle(color: textGrey, fontSize: 11),
        ),
        const SizedBox(height: 14),
        _buildNotificacaoCard(
          title: 'Pedido recebido',
          subtitle: '#PT 2026-188 • Sofia Mendes • Em Avaliação',
          meta: 'Sistema • 11/10/2026, 11:20:00',
          statusText: 'EM AVALIAÇÃO',
          statusColor: const Color(0xFF1EC8C8),
          onOpenTrabalho: () {
            // TODO: Navegar para detalhes do trabalho PT 2026-188
          },
        ),
        const SizedBox(height: 12),
        _buildNotificacaoCard(
          title: 'Prova clínica preparada',
          subtitle: '#PT 2026-179 • João Ferreira • Em Prova',
          meta: 'Ana Rodrigues • 10/10/2026, 15:48:00',
          statusText: 'EM PROVA',
          statusColor: const Color(0xFFD9822B),
          onOpenTrabalho: () {},
        ),
        const SizedBox(height: 12),
        _buildNotificacaoCard(
          title: 'Trabalho colocado em standby',
          subtitle: '#PT 2026-172 • António Vale • Modelos em gesso',
          meta: 'Miguel Duarte • 10/10/2026, 14:22:00',
          statusText: 'EM ESPERA',
          statusColor: const Color(0xFF1EC8C8),
          onOpenTrabalho: () {},
        ),
      ],
    );
  }

  /// Cartão de Notificação Individual com o link "Abrir trabalho"[cite: 8]
  Widget _buildNotificacaoCard({
    required String title,
    required String subtitle,
    required String meta,
    required String statusText,
    required Color statusColor,
    required VoidCallback onOpenTrabalho,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: cardDark,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: borderDark),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 38,
                height: 38,
                decoration: BoxDecoration(
                  color: bgDark,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: borderDark),
                ),
                child: const Icon(
                  Icons.notifications_outlined,
                  color: goldPrimary,
                  size: 18,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            title,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 3,
                          ),
                          decoration: BoxDecoration(
                            color: statusColor.withValues(alpha: 0.12),
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(
                              color: statusColor.withValues(alpha: 0.4),
                            ),
                          ),
                          child: Text(
                            statusText,
                            style: TextStyle(
                              color: statusColor,
                              fontSize: 8.5,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      meta,
                      style: TextStyle(
                        color: textGrey.withValues(alpha: 0.7),
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          const Divider(color: borderDark, height: 1),
          const SizedBox(height: 10),
          GestureDetector(
            onTap: onOpenTrabalho,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Text(
                  'Abrir trabalho',
                  style: TextStyle(
                    color: goldPrimary,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(width: 4),
                Icon(Icons.chevron_right, color: goldPrimary, size: 16),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
