import 'package:material_ui/material_ui.dart';
import '../theme/app_colors.dart';

class PerfilScreen extends StatelessWidget {
  final String nome;
  final String roleBadge;
  final String subtitulo;
  final String email;
  final String contacto;
  final String identificador;
  final List<String> permissoes;
  final String iniciais;
  final Color corTema;

  const PerfilScreen({
    super.key,
    this.nome = 'Dra. Inês Matos',
    this.roleBadge = 'MÉDICA DENTISTA',
    this.subtitulo = 'Clínica São João',
    this.email = 'ines.matos@casasaojoao.pt',
    this.contacto = '+351 232 440 101',
    this.identificador = 'CLI-032',
    this.permissoes = const [
      'Criar pedidos',
      'Consultar pedidos próprios',
      'Partilhar ficheiros',
      'Mensagens com laboratório'
    ],
    this.iniciais = 'IM',
    this.corTema = AppColors.cyanAccent,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: AppColors.backgroundGradient,
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 14.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Topo institucional
                Center(
                  child: Text(
                    'ESTGV  •  TECNOLOGIAS E DESIGN DE MULTIMÉDIA — PI4',
                    style: TextStyle(
                      color: AppColors.creamBeige.withValues(alpha: 0.45),
                      fontSize: 9,
                      letterSpacing: 1.1,
                    ),
                  ),
                ),
                const SizedBox(height: 14),

                // Barra de cabeçalho
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 36,
                      height: 36,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        gradient: AppColors.goldGradient,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text(
                        'CD',
                        style: TextStyle(
                          color: AppColors.bgDark,
                          fontWeight: FontWeight.w900,
                          fontSize: 17,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 5,
                          ),
                          decoration: BoxDecoration(
                            color: corTema.withValues(alpha: 0.12),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: corTema.withValues(alpha: 0.45),
                            ),
                          ),
                          child: Text(
                            roleBadge,
                            style: TextStyle(
                              color: corTema,
                              fontSize: 9,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.8,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        _buildTopIcon(icon: Icons.notifications_none, hasBadge: true),
                        const SizedBox(width: 8),
                        _buildTopIcon(icon: Icons.logout, onTap: () => Navigator.pop(context)),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 14),

                // Sub-barra Sessão autorizada
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.lock_outline,
                          color: AppColors.creamBeige.withValues(alpha: 0.5),
                          size: 13,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          'Sessão autorizada',
                          style: TextStyle(
                            color: AppColors.creamBeige.withValues(alpha: 0.5),
                            fontSize: 11,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      nome,
                      style: const TextStyle(
                        color: AppColors.textLight,
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Divider(
                  color: AppColors.creamBeige.withValues(alpha: 0.1),
                  height: 1,
                ),
                const SizedBox(height: 24),

                // Avatar circular com iniciais
                Center(
                  child: Column(
                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.surfaceDark,
                          border: Border.all(color: corTema, width: 2),
                        ),
                        child: Text(
                          iniciais,
                          style: TextStyle(
                            color: corTema,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: corTema.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: corTema.withValues(alpha: 0.3)),
                        ),
                        child: Text(
                          roleBadge,
                          style: TextStyle(
                            color: corTema,
                            fontSize: 9,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.0,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        nome,
                        style: const TextStyle(
                          color: AppColors.textLight,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        subtitulo,
                        style: TextStyle(
                          color: AppColors.creamBeige.withValues(alpha: 0.65),
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),

                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.surfaceDark.withValues(alpha: 0.5),
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                      color: AppColors.creamBeige.withValues(alpha: 0.12),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildDetailRow('EMAIL', email),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Divider(color: AppColors.creamBeige.withValues(alpha: 0.1), height: 1),
                      ),
                      _buildDetailRow('CONTACTO', contacto),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Divider(color: AppColors.creamBeige.withValues(alpha: 0.1), height: 1),
                      ),
                      _buildDetailRow('IDENTIFICADOR', identificador),
                    ],
                  ),
                ),
                const SizedBox(height: 24),

                const Text(
                  'Permissões ativas',
                  style: TextStyle(
                    color: AppColors.textLight,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),

                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.surfaceDark.withValues(alpha: 0.5),
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                      color: AppColors.creamBeige.withValues(alpha: 0.12),
                    ),
                  ),
                  child: Column(
                    children: permissoes.map((permissao) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 6.0),
                        child: Row(
                          children: [
                            Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.greenOnline.withValues(alpha: 0.15),
                              ),
                              child: const Icon(
                                Icons.check,
                                color: AppColors.greenOnline,
                                size: 12,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Text(
                              permissao,
                              style: TextStyle(
                                color: AppColors.textLight.withValues(alpha: 0.85),
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(height: 24),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.redAccent.withValues(alpha: 0.4),
                    ),
                    color: Colors.redAccent.withValues(alpha: 0.05),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.logout, color: Colors.redAccent, size: 16),
                      SizedBox(width: 8),
                      Text(
                        'Terminar sessão',
                        style: TextStyle(
                          color: Colors.redAccent,
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),

      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
        decoration: BoxDecoration(
          color: AppColors.bgDark,
          border: Border(
            top: BorderSide(
              color: AppColors.creamBeige.withValues(alpha: 0.12),
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavTab(icon: Icons.home_outlined, label: 'Início', active: false),
            _buildNavTab(icon: Icons.add, label: 'Novo', isCenterButton: true),
            _buildNavTab(icon: Icons.chat_bubble_outline, label: 'Mensagens', active: false),
            _buildNavTab(icon: Icons.person_outline, label: 'Perfil', active: true, accentColor: corTema),
          ],
        ),
      ),
    );
  }

  Widget _buildTopIcon({required IconData icon, bool hasBadge = false, VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          Container(
            width: 34,
            height: 34,
            decoration: BoxDecoration(
              color: AppColors.surfaceDark.withValues(alpha: 0.7),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: AppColors.creamBeige.withValues(alpha: 0.15),
              ),
            ),
            child: Icon(icon, color: AppColors.textLight, size: 17),
          ),
          if (hasBadge)
            Positioned(
              right: 6,
              top: 6,
              child: Container(
                width: 7,
                height: 7,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.redAccent,
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: AppColors.creamBeige.withValues(alpha: 0.5),
            fontSize: 9,
            letterSpacing: 1.1,
          ),
        ),
        const SizedBox(height: 3),
        Text(
          value,
          style: const TextStyle(
            color: AppColors.textLight,
            fontSize: 13,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildNavTab({
    required IconData icon,
    required String label,
    bool active = false,
    bool isCenterButton = false,
    Color? accentColor,
  }) {
    final activeColor = accentColor ?? AppColors.goldPrimary;
    if (isCenterButton) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              gradient: AppColors.goldGradient,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: AppColors.bgDark, size: 22),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: AppColors.creamBeige.withValues(alpha: 0.6),
              fontSize: 10,
            ),
          ),
        ],
      );
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          color: active ? activeColor : AppColors.creamBeige.withValues(alpha: 0.55),
          size: 22,
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            color: active ? activeColor : AppColors.creamBeige.withValues(alpha: 0.55),
            fontSize: 10,
            fontWeight: active ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        if (active) ...[
          const SizedBox(height: 4),
          Container(
            width: 18,
            height: 2,
            color: activeColor,
          ),
        ],
      ],
    );
  }
}