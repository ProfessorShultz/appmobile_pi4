import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 34,
                          height: 34,
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
                              fontSize: 16,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'CATARINA DOMINGOS',
                              style: TextStyle(
                                color: AppColors.textLight,
                                fontWeight: FontWeight.bold,
                                fontSize: 11,
                                letterSpacing: 1.0,
                              ),
                            ),
                            Text(
                              'LABORATÓRIO · PRÓTESE DENTÁRIA',
                              style: TextStyle(
                                color: AppColors.creamBeige.withValues(alpha: 0.6),
                                fontSize: 8,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Text(
                      'ESTGV · TDM — PI4',
                      style: TextStyle(
                        color: AppColors.creamBeige.withValues(alpha: 0.5),
                        fontSize: 9,
                        letterSpacing: 0.8,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 14),
                Divider(
                  color: AppColors.creamBeige.withValues(alpha: 0.1),
                  height: 1,
                ),
                const SizedBox(height: 16),

                Row(
                  children: [
                    Icon(
                      Icons.arrow_back,
                      color: AppColors.creamBeige.withValues(alpha: 0.7),
                      size: 15,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Regressar ao site institucional',
                      style: TextStyle(
                        color: AppColors.creamBeige.withValues(alpha: 0.7),
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 22),
                Row(
                  children: [
                    Container(
                      width: 20,
                      height: 1.5,
                      color: AppColors.goldPrimary,
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      'ÁREA RESERVADA',
                      style: TextStyle(
                        color: AppColors.goldPrimary,
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.4,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),

                const Text(
                  'Bem-vindo de volta',
                  style: TextStyle(
                    color: AppColors.textLight,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  'Aceda ao sistema integrado de gestão do laboratório.',
                  style: TextStyle(
                    color: AppColors.creamBeige.withValues(alpha: 0.75),
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 22),

                _buildRoleCard(
                  titulo: 'Administrador',
                  subtitulo: 'Acesso total',
                  icone: Icons.wb_sunny_outlined,
                  selecionado: true,
                ),
                const SizedBox(height: 10),
                _buildRoleCard(
                  titulo: 'Colaborador',
                  subtitulo: 'Produção',
                  icone: Icons.view_in_ar_outlined,
                  selecionado: false,
                ),
                const SizedBox(height: 10),
                _buildRoleCard(
                  titulo: 'Cliente',
                  subtitulo: 'Clínica / dentista',
                  icone: Icons.person_outline,
                  selecionado: false,
                ),
                const SizedBox(height: 22),

                Text(
                  'Email profissional',
                  style: TextStyle(
                    color: AppColors.creamBeige.withValues(alpha: 0.85),
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 8),
                TextField(
                  readOnly: true,
                  decoration: InputDecoration(
                    hintText: 'admin@catarinadomingos.pt',
                    hintStyle: const TextStyle(
                      color: AppColors.textLight,
                      fontSize: 13,
                    ),
                    filled: true,
                    fillColor: AppColors.bgDark.withValues(alpha: 0.65),
                    prefixIcon: Icon(
                      Icons.email_outlined,
                      color: AppColors.creamBeige.withValues(alpha: 0.6),
                      size: 18,
                    ),
                    contentPadding: const EdgeInsets.symmetric(vertical: 14),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: AppColors.creamBeige.withValues(alpha: 0.18),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                Text(
                  'Palavra-passe',
                  style: TextStyle(
                    color: AppColors.creamBeige.withValues(alpha: 0.85),
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 8),
                TextField(
                  readOnly: true,
                  decoration: InputDecoration(
                    hintText: '••••••••••••••',
                    hintStyle: const TextStyle(
                      color: AppColors.textLight,
                      fontSize: 13,
                    ),
                    filled: true,
                    fillColor: AppColors.bgDark.withValues(alpha: 0.65),
                    prefixIcon: Icon(
                      Icons.lock_outline,
                      color: AppColors.creamBeige.withValues(alpha: 0.6),
                      size: 18,
                    ),
                    suffixIcon: Icon(
                      Icons.visibility_outlined,
                      color: AppColors.creamBeige.withValues(alpha: 0.6),
                      size: 18,
                    ),
                    contentPadding: const EdgeInsets.symmetric(vertical: 14),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: AppColors.creamBeige.withValues(alpha: 0.18),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 14),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 18,
                          height: 18,
                          decoration: BoxDecoration(
                            color: AppColors.goldPrimary,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: const Icon(
                            Icons.check,
                            color: AppColors.bgDark,
                            size: 14,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Manter sessão iniciada',
                          style: TextStyle(
                            color: AppColors.creamBeige.withValues(alpha: 0.75),
                            fontSize: 11,
                          ),
                        ),
                      ],
                    ),
                    const Text(
                      'Recuperar palavra-passe',
                      style: TextStyle(
                        color: AppColors.goldPrimary,
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 22),

                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  decoration: BoxDecoration(
                    gradient: AppColors.goldGradient,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Aceder ao sistema',
                        style: TextStyle(
                          color: AppColors.bgDark,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                        ),
                      SizedBox(width: 8),
                      Icon(
                        Icons.arrow_forward,
                        color: AppColors.bgDark,
                        size: 18,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.warning_amber_rounded,
                      color: AppColors.creamBeige.withValues(alpha: 0.45),
                      size: 14,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      'Acesso demonstrativo — sem autenticação real',
                      style: TextStyle(
                        color: AppColors.creamBeige.withValues(alpha: 0.45),
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                Container(
                  width: 38,
                  height: 38,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.surfaceDark.withValues(alpha: 0.6),
                    border: Border.all(
                      color: AppColors.goldPrimary.withValues(alpha: 0.35),
                    ),
                  ),
                  child: const Icon(
                    Icons.wb_sunny_outlined,
                    color: AppColors.goldPrimary,
                    size: 18,
                  ),
                ),
                const SizedBox(height: 16),
                Center(
                  child: RichText(
                    text: TextSpan(
                      style: const TextStyle(fontSize: 11),
                      children: [
                        TextSpan(
                          text: 'Precisa de ajuda? ',
                          style: TextStyle(
                            color: AppColors.creamBeige.withValues(alpha: 0.5),
                          ),
                        ),
                        const TextSpan(
                          text: 'Contactar suporte técnico',
                          style: TextStyle(
                            color: AppColors.goldPrimary,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRoleCard({
    required String titulo,
    required String subtitulo,
    required IconData icone,
    required bool selecionado,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 13),
      decoration: BoxDecoration(
        color: selecionado
            ? AppColors.surfaceDark.withValues(alpha: 0.85)
            : AppColors.bgDark.withValues(alpha: 0.45),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: selecionado
              ? AppColors.goldPrimary
              : AppColors.creamBeige.withValues(alpha: 0.15),
          width: selecionado ? 1.4 : 1.0,
        ),
      ),
      child: Row(
        children: [
          Icon(
            icone,
            color: selecionado
                ? AppColors.goldPrimary
                : AppColors.creamBeige.withValues(alpha: 0.6),
            size: 20,
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  titulo,
                  style: const TextStyle(
                    color: AppColors.textLight,
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitulo,
                  style: TextStyle(
                    color: AppColors.creamBeige.withValues(alpha: 0.6),
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),
          if (selecionado)
            const Icon(
              Icons.check,
              color: AppColors.goldPrimary,
              size: 18,
            ),
        ],
      ),
    );
  }
}