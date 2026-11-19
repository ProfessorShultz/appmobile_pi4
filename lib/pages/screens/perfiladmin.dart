import 'package:material_ui/material_ui.dart';

class PerfilAdminPage extends StatefulWidget {
  const PerfilAdminPage({super.key});

  @override
  State<PerfilAdminPage> createState() => _PerfilAdminPageState();
}

class _PerfilAdminPageState extends State<PerfilAdminPage> {
  int _selectedIndex = 3; // "Perfil" está selecionado

  // Paleta de cores oficial do projeto
  static const Color bgDark = Color(0xFF0D0D0D);
  static const Color cardDark = Color(0xFF161618);
  static const Color borderDark = Color(0xFF262629);
  static const Color goldPrimary = Color(0xFFD4AF37);
  static const Color goldLight = Color(0xFFF3D06B);
  static const Color textGrey = Color(0xFF8E8E93);
  static const Color successGreen = Color(0xFF1EC8C8);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgDark,
      body: SafeArea(
        child: Column(
          children: [
            _buildTopHeader(),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(16, 20, 16, 90),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildProfileHeaderCard(),
                    const SizedBox(height: 20),
                    _buildPersonalInformationSection(),
                    const SizedBox(height: 20),
                    _buildPermissionsSection(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  /// Cabeçalho superior fixo institucional
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

  /// Cartão Principal do Perfil (Avatar + Nome + Botão Editar)[cite: 6]
  Widget _buildProfileHeaderCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: cardDark,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: borderDark),
      ),
      child: Column(
        children: [
          Container(
            width: 72,
            height: 72,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: goldPrimary, width: 1.5),
              color: goldPrimary.withValues(alpha: 0.1),
            ),
            child: const Center(
              child: Text(
                'CD',
                style: TextStyle(
                  color: goldPrimary,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: goldPrimary.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: goldPrimary.withValues(alpha: 0.4)),
            ),
            child: const Text(
              'ADMINISTRADORA',
              style: TextStyle(
                color: goldPrimary,
                fontSize: 9,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.0,
              ),
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Catarina Domingos',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 2),
          const Text(
            'Laboratório Catarina Domingos',
            style: TextStyle(color: textGrey, fontSize: 12),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            height: 44,
            child: OutlinedButton(
              onPressed: () {
                // TODO: Ação de editar perfil
              },
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: borderDark),
                backgroundColor: bgDark,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                'Editar perfil',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Secção de Informação Pessoal[cite: 6, 7]
  Widget _buildPersonalInformationSection() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: cardDark,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: borderDark),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Informação pessoal',
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 2),
          const Text(
            'Dados de identificação e contacto',
            style: TextStyle(color: textGrey, fontSize: 11),
          ),
          const SizedBox(height: 16),
          _buildInfoFieldBox('Nome completo', 'Catarina Domingos'),
          const SizedBox(height: 12),
          _buildInfoFieldBox('Email profissional', 'admin@catarinadomingos.pt'),
          const SizedBox(height: 12),
          _buildInfoFieldBox('Contacto telefónico', '+351 232 000 184'),
          const SizedBox(height: 12),
          _buildInfoFieldBox('Identificador de utilizador', 'ADM-001'),
        ],
      ),
    );
  }

  Widget _buildInfoFieldBox(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(color: textGrey, fontSize: 11)),
        const SizedBox(height: 6),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
          decoration: BoxDecoration(
            color: bgDark,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: borderDark),
          ),
          child: Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }

  /// Secção de Permissões Ativas[cite: 7]
  Widget _buildPermissionsSection() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: cardDark,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: borderDark),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Permissões ativas',
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 2),
          const Text(
            'Perfil de acesso: Administradora',
            style: TextStyle(color: textGrey, fontSize: 11),
          ),
          const SizedBox(height: 16),
          _buildPermissionItem('Acesso total'),
          _buildPermissionItem('Gestão de utilizadores'),
          _buildPermissionItem('Gestão de trabalhos'),
          _buildPermissionItem('Configuração do sistema', isLast: true),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: bgDark,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: borderDark),
            ),
            child: Row(
              children: const [
                Icon(Icons.lock_outline, color: textGrey, size: 14),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'As permissões são geridas pelo administrador.',
                    style: TextStyle(color: textGrey, fontSize: 11),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPermissionItem(String text, {bool isLast = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        border: isLast
            ? null
            : const Border(bottom: BorderSide(color: borderDark, width: 1)),
      ),
      child: Row(
        children: [
          Container(
            width: 22,
            height: 22,
            decoration: BoxDecoration(
              color: successGreen.withValues(alpha: 0.12),
              shape: BoxShape.circle,
              border: Border.all(color: successGreen.withValues(alpha: 0.4)),
            ),
            child: const Icon(Icons.check, color: successGreen, size: 14),
          ),
          const SizedBox(width: 12),
          Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 13,
              fontWeight: FontWeight.w500,
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
          _buildNavItem(0, Icons.grid_view_rounded, 'Resumo', () {
            // TODO: Navegar para Home
          }),
          _buildNavItem(1, Icons.assignment_outlined, 'Trabalhos', () {
            // TODO: Navegar para Trabalhos
          }),
          _buildCreateNavItem(),
          _buildNavItem(3, Icons.person_outline_rounded, 'Perfil', () {
            setState(() => _selectedIndex = 3);
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
