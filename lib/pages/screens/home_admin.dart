import 'package:material_ui/material_ui.dart';

class HomeAdminPage extends StatefulWidget {
  const HomeAdminPage({super.key});

  @override
  State<HomeAdminPage> createState() => _HomeAdminPageState();
}

class _HomeAdminPageState extends State<HomeAdminPage> {
  int _selectedIndex = 0;

  // Paleta de cores extraída do protótipo
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
            _buildTopHeader(),
            Expanded(
              child: Stack(
                children: [
                  SingleChildScrollView(
                    padding: const EdgeInsets.fromLTRB(16, 20, 16, 90),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildOperationalHeader(),
                        const SizedBox(height: 20),
                        _buildKpiGrid(),
                        const SizedBox(height: 28),
                        _buildPrioritySection(),
                        const SizedBox(height: 28),
                        _buildTeamActivitySection(),
                      ],
                    ),
                  ),
                  // Botão flutuante de tema (canto inferior esquerdo)
                  Positioned(
                    left: 16,
                    bottom: 16,
                    child: Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        color: cardDark,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: goldPrimary.withValues(alpha: 0.4),
                        ),
                      ),
                      child: IconButton(
                        icon: const Icon(
                          Icons.wb_sunny_outlined,
                          color: goldPrimary,
                          size: 20,
                        ),
                        onPressed: () {
                          // TODO: Alternar tema claro/escuro
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  /// Cabeçalho superior fixo (Institucional + Logo + Perfil)
  Widget _buildTopHeader() {
    return Container(
      decoration: const BoxDecoration(
        color: bgDark,
        border: Border(bottom: BorderSide(color: borderDark, width: 1)),
      ),
      child: Column(
        children: [
          // Barra superior institucional
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
          // Linha do Logo e Ações
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
            child: Row(
              children: [
                // Logo estilizado (Dente / D)
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
                // Badge ADMINISTRADOR
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color: goldPrimary.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: goldPrimary.withValues(alpha: 0.5)),
                  ),
                  child: const Text(
                    'ADMINISTRADOR',
                    style: TextStyle(
                      color: goldPrimary,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.8,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                // Botão Notificações com ponto vermelho
                _buildHeaderIconButton(
                  icon: Icons.notifications_none_rounded,
                  hasBadge: true,
                  onTap: () {},
                ),
                const SizedBox(width: 8),
                // Botão Logout
                _buildHeaderIconButton(
                  icon: Icons.logout_rounded,
                  hasBadge: false,
                  onTap: () {},
                ),
              ],
            ),
          ),
          // Sub-barra de estado da sessão
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

  Widget _buildHeaderIconButton({
    required IconData icon,
    required bool hasBadge,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          color: cardDark,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: borderDark),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Icon(icon, color: Colors.white70, size: 18),
            if (hasBadge)
              Positioned(
                top: 8,
                right: 9,
                child: Container(
                  width: 7,
                  height: 7,
                  decoration: const BoxDecoration(
                    color: Color(0xFFE53935),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  /// Título "Visão operacional" e Avatar CD
  Widget _buildOperationalHeader() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'ADMINISTRAÇÃO MÓVEL',
                style: TextStyle(
                  color: goldPrimary,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
              ),
              SizedBox(height: 4),
              Text(
                'Visão operacional',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4),
              Text(
                'Decisões rápidas, longe do backoffice.',
                style: TextStyle(color: textGrey, fontSize: 12),
              ),
            ],
          ),
        ),
        Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: goldPrimary.withValues(alpha: 0.12),
            shape: BoxShape.circle,
            border: Border.all(color: goldPrimary.withValues(alpha: 0.5)),
          ),
          child: const Center(
            child: Text(
              'CD',
              style: TextStyle(
                color: goldPrimary,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ),
        ),
      ],
    );
  }

  /// Grelha 2x2 de KPIs
  Widget _buildKpiGrid() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(child: _buildKpiCard('1', 'Por aceitar')),
            const SizedBox(width: 12),
            Expanded(child: _buildKpiCard('1', 'Em produção')),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(child: _buildKpiCard('1', 'Em standby')),
            const SizedBox(width: 12),
            Expanded(child: _buildKpiCard('0', 'Concluídos')),
          ],
        ),
      ],
    );
  }

  Widget _buildKpiCard(String count, String label) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: cardDark,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: borderDark),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            count,
            style: const TextStyle(
              color: goldPrimary,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            label,
            style: const TextStyle(color: textGrey, fontSize: 12),
          ),
        ],
      ),
    );
  }

  /// Secção Prazos Prioritários
  Widget _buildPrioritySection() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Prazos prioritários',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: const Text(
                'Ver mais',
                style: TextStyle(
                  color: goldPrimary,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        _buildPriorityCard(
          code: '#PT-2026-184 • Digital',
          clientName: 'Mariana Lopes',
          workType: 'Coroa Dissilicato',
          statusText: 'EM PROCESSAMENTO',
          accentColor: const Color(0xFFE55353),
          icon: Icons.description_outlined,
        ),
        const SizedBox(height: 10),
        _buildPriorityCard(
          code: '#PT-2026-179 • Físico',
          clientName: 'João Ferreira',
          workType: 'Prótese Acrílica',
          statusText: 'EM PROVA',
          accentColor: const Color(0xFFD9822B),
          icon: Icons.view_in_ar_outlined,
        ),
        const SizedBox(height: 10),
        _buildPriorityCard(
          code: '#PT-2026-172 • Físico',
          clientName: 'António Vale',
          workType: 'Prótese Esquelética',
          statusText: 'EM ESPERA',
          accentColor: const Color(0xFF1EC8C8),
          icon: Icons.view_in_ar_outlined,
        ),
      ],
    );
  }

  Widget _buildPriorityCard({
    required String code,
    required String clientName,
    required String workType,
    required String statusText,
    required Color accentColor,
    required IconData icon,
  }) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: cardDark,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: borderDark),
      ),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: accentColor.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: accentColor.withValues(alpha: 0.3)),
            ),
            child: Icon(icon, color: accentColor, size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  code,
                  style: const TextStyle(color: textGrey, fontSize: 10),
                ),
                const SizedBox(height: 3),
                Text(
                  clientName,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  workType,
                  style: const TextStyle(color: textGrey, fontSize: 12),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: accentColor.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(color: accentColor.withValues(alpha: 0.4)),
                ),
                child: Text(
                  statusText,
                  style: TextStyle(
                    color: accentColor,
                    fontSize: 9,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Icon(Icons.chevron_right, color: textGrey, size: 18),
            ],
          ),
        ],
      ),
    );
  }

  /// Secção Atividade da Equipa
  Widget _buildTeamActivitySection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Atividade da equipa',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 14),
        _buildActivityItem(
          title: 'Etapa assumida',
          subtitle: 'Mariana Lopes • Fresagem CAD/CAM',
          author: 'Filipe Martins',
        ),
        _buildActivityItem(
          title: 'Prova clínica preparada',
          subtitle: 'João Ferreira • Prova clínica',
          author: 'Ana Rodrigues',
        ),
        _buildActivityItem(
          title: 'Pedido recebido',
          subtitle: 'Sofia Mendes • Em Avaliação',
          author: 'Sistema',
          isLast: true,
        ),
      ],
    );
  }

  Widget _buildActivityItem({
    required String title,
    required String subtitle,
    required String author,
    bool isLast = false,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        border: isLast
            ? null
            : const Border(bottom: BorderSide(color: borderDark, width: 1)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 38,
            height: 38,
            decoration: BoxDecoration(
              color: cardDark,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: borderDark),
            ),
            child: const Icon(
              Icons.check,
              color: Color(0xFF1EC8C8),
              size: 18,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  subtitle,
                  style: const TextStyle(color: textGrey, fontSize: 11),
                ),
                const SizedBox(height: 4),
                Text(
                  author,
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
    );
  }

  /// Barra de Navegação Inferior
  Widget _buildBottomNavBar() {
    return Container(
      height: 72,
      decoration: const BoxDecoration(
        color: Color(0xFF111113),
        border: Border(top: BorderSide(color: borderDark, width: 1)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(0, Icons.grid_view_rounded, 'Resumo'),
          _buildNavItem(1, Icons.assignment_outlined, 'Trabalhos'),
          _buildCreateNavItem(),
          _buildNavItem(3, Icons.person_outline_rounded, 'Perfil'),
        ],
      ),
    );
  }

  Widget _buildNavItem(int index, IconData icon, String label) {
    final bool isSelected = _selectedIndex == index;
    return GestureDetector(
      onTap: () => setState(() => _selectedIndex = index),
      behavior: HitTestBehavior.opaque,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: isSelected ? goldPrimary : textGrey,
            size: 22,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? goldPrimary : textGrey,
              fontSize: 10,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
            ),
          ),
          const SizedBox(height: 3),
          Container(
            width: 14,
            height: 2,
            decoration: BoxDecoration(
              color: isSelected ? goldPrimary : Colors.transparent,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCreateNavItem() {
    return GestureDetector(
      onTap: () {
        // TODO: Navegar para ecrã de criação de pedido
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 40,
            height: 34,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [goldLight, goldPrimary],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(Icons.add, color: Colors.black, size: 22),
          ),
          const SizedBox(height: 4),
          const Text(
            'Criar',
            style: TextStyle(color: textGrey, fontSize: 10),
          ),
        ],
      ),
    );
  }
}