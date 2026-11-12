import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import 'login_screen.dart';

class PaginaPrincipal extends StatelessWidget {
  const PaginaPrincipal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppColors.backgroundGradient,
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Cabeçalho / Logótipo
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        gradient: AppColors.goldGradient,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text(
                        'CD',
                        style: TextStyle(
                          color: AppColors.bgDark,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'CATARINA DOMINGOS',
                          style: TextStyle(
                            color: AppColors.textLight,
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                            letterSpacing: 1.1,
                          ),
                        ),
                        Text(
                          'LABORATÓRIO PRÓTESE DENTÁRIA',
                          style: TextStyle(
                            color: AppColors.creamBeige,
                            fontSize: 9,
                            letterSpacing: 0.8,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                const Text(
                  '— RECEÇÃO DIGITAL',
                  style: TextStyle(
                    color: AppColors.goldPrimary,
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.2,
                  ),
                ),
                const SizedBox(height: 24),

                // Título Principal com destaque dourado
                RichText(
                  text: const TextSpan(
                    style: TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                      height: 1.15,
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

                const Text(
                  'Entre na área reservada para acompanhar pedidos, gerir a produção e comunicar com o laboratório.',
                  style: TextStyle(
                    color: AppColors.creamBeige,
                    fontSize: 13,
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 28),
                // Cartão "Área Reservada"
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: AppColors.surfaceDark.withOpacity(0.85),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: AppColors.goldDark.withOpacity(0.4)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'ÁREA RESERVADA',
                        style: TextStyle(
                          color: AppColors.creamBeige,
                          fontSize: 10,
                          letterSpacing: 1.2,
                        ),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        'Identifique-se para continuar',
                        style: TextStyle(
                          color: AppColors.textLight,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Botão com Gradiente Dourado
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginScreen(),
                            ),
                          );
                        },
                        child: Container(
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
                                  fontSize: 15,
                                ),
                              ),
                              SizedBox(width: 8),
                              Icon(Icons.arrow_forward, color: AppColors.bgDark, size: 18),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 14),
                      const Row(
                        children: [
                          Icon(Icons.lock_outline, color: AppColors.creamBeige, size: 14),
                          SizedBox(width: 6),
                          Text(
                            'Acesso seguro e reservado\nAdministrador · Colaborador · Cliente',
                            style: TextStyle(
                              color: AppColors.creamBeige,
                              fontSize: 11,
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