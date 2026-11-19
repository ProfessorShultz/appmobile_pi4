import 'package:material_ui/material_ui.dart';

import '../theme/app_colors.dart';

class PaginaPrincipal extends StatelessWidget {
  const PaginaPrincipal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(gradient: AppColors.backgroundGradient),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
              horizontal: 24.0,
              vertical: 20.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 42,
                      height: 42,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        gradient: AppColors.goldGradient,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Text(
                        'CD',
                        style: TextStyle(
                          color: AppColors.bgDark,
                          fontWeight: FontWeight.w900,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'CATARINA DOMINGOS',
                          style: TextStyle(
                            color: AppColors.textLight,
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                            letterSpacing: 1.2,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          'LABORATÓRIO · PRÓTESE DENTÁRIA',
                          style: TextStyle(
                            color: AppColors.creamBeige.withValues(alpha: 0.65),
                            fontSize: 9,
                            letterSpacing: 0.8,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 14),
                Row(
                  children: [
                    Container(
                      width: 24,
                      height: 1.5,
                      color: AppColors.goldPrimary,
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      'RECEÇÃO DIGITAL',
                      style: TextStyle(
                        color: AppColors.goldPrimary,
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.5,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                // Título Principal
                RichText(
                  text: const TextSpan(
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      height: 1.12,
                    ),
                    children: [
                      TextSpan(
                        text: 'Bem-vindo ao\n',
                        style: TextStyle(color: AppColors.textLight),
                      ),
                      TextSpan(
                        text: 'Laboratório\nCatarina\nDomingos.',
                        style: TextStyle(color: AppColors.goldPrimary),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Entre na área reservada para acompanhar pedidos, gerir a produção e comunicar com o laboratório.',
                  style: TextStyle(
                    color: AppColors.creamBeige.withValues(alpha: 0.8),
                    fontSize: 13,
                    height: 1.45,
                  ),
                ),
                const SizedBox(height: 28),

                // Cartão Área Reservada
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: AppColors.surfaceDark.withValues(alpha: 0.6),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: AppColors.goldPrimary.withValues(alpha: 0.25),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 36,
                            height: 36,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.bgDark,
                              border: Border.all(
                                color: AppColors.goldPrimary.withValues(
                                  alpha: 0.3,
                                ),
                              ),
                            ),
                            child: Container(
                              width: 8,
                              height: 8,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.greenOnline,
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'ÁREA RESERVADA',
                                style: TextStyle(
                                  color: AppColors.creamBeige.withValues(
                                    alpha: 0.6,
                                  ),
                                  fontSize: 9,
                                  letterSpacing: 1.2,
                                ),
                              ),
                              const SizedBox(height: 2),
                              const Text(
                                'Identifique-se para continuar',
                                style: TextStyle(
                                  color: AppColors.textLight,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),

                      InkWell(
                        onTap: () => Navigator.of(context).pushNamed('/login'),
                        borderRadius: BorderRadius.circular(10),
                        child: Ink(
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
                                'Iniciar sessão',
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
                      ),
                      const SizedBox(height: 16),
                      Divider(
                        color: AppColors.creamBeige.withValues(alpha: 0.12),
                        height: 1,
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          Icon(
                            Icons.lock_outline,
                            color: AppColors.creamBeige.withValues(alpha: 0.6),
                            size: 14,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            'Acesso seguro e reservado',
                            style: TextStyle(
                              color: AppColors.creamBeige.withValues(
                                alpha: 0.6,
                              ),
                              fontSize: 11,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Administrador · Colaborador · Cliente',
                        style: TextStyle(
                          color: AppColors.creamBeige.withValues(alpha: 0.45),
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                // Linha informativa
                Center(
                  child: Text(
                    'Viseu, Portugal   •   Prótese Dentária   •   Sistema Integrado de Gestão',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.creamBeige.withValues(alpha: 0.45),
                      fontSize: 10,
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Destaque Inferior
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    gradient: LinearGradient(
                      colors: [
                        AppColors.surfaceDark,
                        AppColors.goldDark.withValues(alpha: 0.35),
                        AppColors.bgDark,
                      ],
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                    ),
                    border: Border.all(
                      color: AppColors.creamBeige.withValues(alpha: 0.15),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 40),
                      Text(
                        'LABORATÓRIO CATARINA DOMINGOS',
                        style: TextStyle(
                          color: AppColors.goldPrimary.withValues(alpha: 0.9),
                          fontSize: 9,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.3,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 38,
                            height: 38,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.bgDark.withValues(alpha: 0.8),
                              border: Border.all(
                                color: AppColors.goldPrimary.withValues(
                                  alpha: 0.4,
                                ),
                              ),
                            ),
                            child: const Icon(
                              Icons.wb_sunny_outlined,
                              color: AppColors.goldPrimary,
                              size: 18,
                            ),
                          ),
                          const SizedBox(width: 12),
                          const Expanded(
                            child: Text(
                              'Precisão técnica.\nConfiança em cada\ndetalhe.',
                              style: TextStyle(
                                color: AppColors.textLight,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                height: 1.15,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
