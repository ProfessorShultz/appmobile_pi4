import 'package:material_ui/material_ui.dart';

import 'detalhe_trabalho_page.dart';

class TrabalhosAdminPage extends StatefulWidget {
  const TrabalhosAdminPage({super.key});

  @override
  State<TrabalhosAdminPage> createState() => _TrabalhosAdminPageState();
}

class _TrabalhosAdminPageState extends State<TrabalhosAdminPage> {
  int _selectedIndex = 1; // "Trabalhos" está selecionado

  // Paleta de cores do protótipo
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
                        _buildPageHeader(),
                        const SizedBox(height: 20),
                        _buildCreateButton(context),
                        const SizedBox(height: 24),
                        _buildTrabalhosListSection(context),
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
                const SizedBox(width: 8),
                _buildHeaderIconButton(
                  icon: Icons.notifications_none_rounded,
                  hasBadge: true,
                  onTap: () {},
                ),
                const SizedBox(width: 8),
                _buildHeaderIconButton(
                  icon: Icons.logout_rounded,
                  hasBadge: false,
                  onTap: () {},
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

  /// Título da Página
  Widget _buildPageHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'Gestão global de trabalhos',
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 4),
        Text(
          'Filtros combináveis sobre a fonte de dados partilhada.',
          style: TextStyle(color: textGrey, fontSize: 12),
        ),
      ],
    );
  }

  /// Botão de Destaque Dourado para Criar Trabalho
  Widget _buildCreateButton(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 48,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [goldLight, goldPrimary],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: ElevatedButton.icon(
        onPressed: () {
          // TODO: Ação de criar trabalho em nome de cliente
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        icon: const Icon(Icons.add, color: Colors.black, size: 20),
        label: const Text(
          'Criar trabalho em nome de cliente',
          style: TextStyle(
            color: Colors.black,
            fontSize: 13,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  /// Lista de Trabalhos do Laboratório
  Widget _buildTrabalhosListSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Trabalhos do laboratório',
          style: TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        const Text(
          '4 de 4 trabalhos',
          style: TextStyle(color: textGrey, fontSize: 11),
        ),
        const SizedBox(height: 14),
        _buildTrabalhoCard(
          clientName: 'Mariana Lopes',
          code: '#PT 2026-184 • Digital',
          workType: 'Coroa Dissilicato',
          doctor: 'Dr. Tomás Reis',
          date: '12/10/2026',
          daysLeft: '0 dias',
          statusText: 'EM PROCESSAMENTO',
          statusColor: const Color(0xFFE55353),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const DetalheTrabalhoPage(
                  codigo: '#PT 2026-184 • Digital',
                  cliente: 'Mariana Lopes',
                  tipoTrabalho: 'Coroa Dissilicato',
                  medico: 'Dr. Tomás Reis',
                  dataEntrega: '12/10/2026',
                  estado: 'Em processamento',
                  corEstado: Color(0xFFE55353),
                ),
              ),
            );
          },
        ),
        const SizedBox(height: 12),
        _buildTrabalhoCard(
          clientName: 'João Ferreira',
          code: '#PT 2026-179 • Físico',
          workType: 'Prótese Acrílica',
          doctor: 'Dra. Inês Matos',
          date: '13/10/2026',
          daysLeft: '0 dias',
          statusText: 'EM PROVA',
          statusColor: const Color(0xFFD9822B),
          onTap: () {},
        ),
        const SizedBox(height: 12),
        _buildTrabalhoCard(
          clientName: 'António Vale',
          code: '#PT 2026-172 • Físico',
          workType: 'Prótese Esquelética',
          doctor: 'Dra. Rita Alves',
          date: '16/10/2026',
          daysLeft: '0 dias',
          statusText: 'EM ESPERA',
          statusColor: const Color(0xFF1EC8C8),
          onTap: () {},
        ),
        const SizedBox(height: 12),
        _buildTrabalhoCard(
          clientName: 'Sofia Mendes',
          code: '#PT 2026-169 • Digital',
          workType: 'Provisório CAD/CAM',
          doctor: 'Dr. Carlos Silva',
          date: '18/10/2026',
          daysLeft: '2 dias',
          statusText: 'EM AVALIAÇÃO',
          statusColor: const Color(0xFF1EC8C8),
          onTap: () {},
        ),
      ],
    );
  }

  /// Cartão Individual de Trabalho (Clicável)[cite: 3]
  Widget _buildTrabalhoCard({
    required String clientName,
    required String code,
    required String workType,
    required String doctor,
    required String date,
    required String daysLeft,
    required String statusText,
    required Color statusColor,
    required VoidCallback onTap,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: cardDark,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: borderDark),
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(14),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(14),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          clientName,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          code,
                          style: const TextStyle(color: textGrey, fontSize: 11),
                        ),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
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
                          fontSize: 9,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  workType,
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  doctor,
                  style: const TextStyle(color: textGrey, fontSize: 12),
                ),
                const SizedBox(height: 14),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      date,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      daysLeft,
                      style: const TextStyle(color: textGrey, fontSize: 11),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
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
          _buildNavItem(0, Icons.grid_view_rounded, 'Resumo', () {
            setState(() => _selectedIndex = 0);
            // TODO: Navegar para a home page
          }),
          _buildNavItem(1, Icons.assignment_outlined, 'Trabalhos', () {
            setState(() => _selectedIndex = 1);
          }),
          _buildCreateNavItem(),
          _buildNavItem(3, Icons.person_outline_rounded, 'Perfil', () {
            setState(() => _selectedIndex = 3);
            // TODO: Navegar para o perfil
          }),
        ],
      ),
    );
  }

  Widget _buildNavItem(
    int index,
    IconData icon,
    String label,
    VoidCallback onTap,
  ) {
    final bool isSelected = _selectedIndex == index;
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: isSelected ? goldPrimary : textGrey, size: 22),
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
        // TODO: Ação de criar
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
          const Text('Criar', style: TextStyle(color: textGrey, fontSize: 10)),
        ],
      ),
    );
  }
}
