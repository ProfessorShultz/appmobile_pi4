import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String perfilSelecionado = 'Administrador';
  bool manterSessao = true;
  bool ocultarPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: AppColors.backgroundGradient,
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Botão para regressar ao ecrã anterior
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const Row(
                    children: [
                      Icon(Icons.arrow_back, color: AppColors.creamBeige, size: 16),
                      SizedBox(width: 8),
                      Text(
                        'Regressar ao site institucional',
                        style: TextStyle(
                          color: AppColors.creamBeige,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),

                // Etiqueta Área Reservada
                const Text(
                  '— ÁREA RESERVADA',
                  style: TextStyle(
                    color: AppColors.goldPrimary,
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.2,
                  ),
                ),
                const SizedBox(height: 8),

                // Título e Subtítulo
                const Text(
                  'Bem-vindo de volta',
                  style: TextStyle(
                    color: AppColors.textLight,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 6),
                const Text(
                  'Aceda ao sistema integrado de gestão do laboratório.',
                  style: TextStyle(
                    color: AppColors.creamBeige,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 24),

                // Cartões de Seleção de Perfil
                _buildRoleCard(
                  titulo: 'Administrador',
                  subtitulo: 'Acesso total',
                  icone: Icons.wb_sunny_outlined,
                ),
                const SizedBox(height: 10),
                _buildRoleCard(
                  titulo: 'Colaborador',
                  subtitulo: 'Produção',
                  icone: Icons.view_in_ar_outlined,
                ),
                const SizedBox(height: 10),
                _buildRoleCard(
                  titulo: 'Cliente',
                  subtitulo: 'Clínica / Médico',
                  icone: Icons.person_outline,
                ),
                const SizedBox(height: 24),

                // Campo Email Profissional
                const Text(
                  'Email profissional',
                  style: TextStyle(
                    color: AppColors.textLight,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 8),
                TextField(
                  style: const TextStyle(color: AppColors.textLight, fontSize: 14),
                  controller: TextEditingController(text: 'admin@catarinadomingos.pt'),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: AppColors.bgDark.withOpacity(0.6),
                    prefixIcon: const Icon(Icons.email_outlined, color: AppColors.creamBeige, size: 18),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: AppColors.goldDark.withOpacity(0.4)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: AppColors.goldPrimary),
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // Campo Palavra-passe
                const Text(
                  'Palavra-passe',
                  style: TextStyle(
                    color: AppColors.textLight,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 8),
                TextField(
                  obscureText: ocultarPassword,
                  style: const TextStyle(color: AppColors.textLight, fontSize: 14),
                  controller: TextEditingController(text: '••••••••••••••'),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: AppColors.bgDark.withOpacity(0.6),
                    prefixIcon: const Icon(Icons.lock_outline, color: AppColors.creamBeige, size: 18),
                    suffixIcon: IconButton(
                      icon: Icon(
                        ocultarPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                        color: AppColors.creamBeige,
                        size: 18,
                      ),
                      onPressed: () {
                        setState(() {
                          ocultarPassword = !ocultarPassword;
                        });
                      },
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: AppColors.goldDark.withOpacity(0.4)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: AppColors.goldPrimary),
                    ),
                  ),
                ),
                const SizedBox(height: 12),

                // Manter sessão iniciada + Recuperar palavra-passe
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 24,
                          height: 24,
                          child: Checkbox(
                            value: manterSessao,
                            activeColor: AppColors.goldPrimary,
                            checkColor: AppColors.bgDark,
                            onChanged: (val) {
                              setState(() {
                                manterSessao = val ?? false;
                              });
                            },
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Text(
                          'Manter sessão iniciada',
                          style: TextStyle(color: AppColors.creamBeige, fontSize: 12),
                          ),
                      ],
                    ),
                    const Text(
                      'Recuperar palavra-passe',
                      style: TextStyle(
                        color: AppColors.goldPrimary,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                // Botão "Aceder ao sistema" com Gradiente Dourado
                GestureDetector(
                  onTap: () {
                    // Aqui pode navegar para o 3º ecrã (Dashboard do Sistema)
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
                          'Aceder ao sistema',
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
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Widget auxiliar para desenhar cada cartão de perfil (Administrador, Colaborador, Cliente)
  Widget _buildRoleCard({
    required String titulo,
    required String subtitulo,
    required IconData icone,
  }) {
    final bool selecionado = perfilSelecionado == titulo;

    return GestureDetector(
      onTap: () {
        setState(() {
          perfilSelecionado = titulo;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: selecionado
              ? AppColors.surfaceDark
              : AppColors.bgDark.withOpacity(0.5),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: selecionado
                ? AppColors.goldPrimary
                : AppColors.creamBeige.withOpacity(0.15),
            width: selecionado ? 1.5 : 1.0,
          ),
        ),
        child: Row(
          children: [
            Icon(
              icone,
              color: selecionado ? AppColors.goldPrimary : AppColors.creamBeige,
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
                  Text(
                    subtitulo,
                    style: const TextStyle(
                      color: AppColors.creamBeige,
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
      ),
    );
  }
}