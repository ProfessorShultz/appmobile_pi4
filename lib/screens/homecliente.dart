import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class HomeCliente extends StatelessWidget {
  const HomeCliente({super.key});

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
                            color: AppColors.cyanAccent.withValues(alpha: 0.12),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: AppColors.cyanAccent.withValues(alpha: 0.45),
                            ),
                          ),
                          child: const Text(
                            'MÉDICA DENTISTA',
                            style: TextStyle(
                              color: AppColors.cyanAccent,
                              fontSize: 9,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.8,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        _buildTopIcon(
                          icon: Icons.notifications_none,
                          hasBadge: true,
                        ),
                        const SizedBox(width: 8),
                        _buildTopIcon(icon: Icons.logout),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 14),

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
                    const Text(
                      'Dra. Inês Matos',
                      style: TextStyle(
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
                const SizedBox(height: 18),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'PORTAL DA CLÍNICA',
                          style: TextStyle(
                            color: AppColors.goldPrimary,
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1.3,
                          ),
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          'Bom dia, Dra. Inês',
                          style: TextStyle(
                            color: AppColors.textLight,
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Acompanhe a produção sem telefonemas.',
                          style: TextStyle(
                            color: AppColors.creamBeige.withValues(alpha: 0.65),
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: 44,
                      height: 44,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.goldDark.withValues(alpha: 0.35),
                        border: Border.all(color: AppColors.goldPrimary),
                      ),
                      child: const Text(
                        'IM',
                        style: TextStyle(
                          color: AppColors.textLight,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 22),

                Container(
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: AppColors.surfaceDark.withValues(alpha: 0.65),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: AppColors.goldPrimary.withValues(alpha: 0.25),
),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'PEDIDOS EM PROCESSAMENTO',
                              style: TextStyle(
                                color: AppColors.goldPrimary.withValues(alpha: 0.9),
                                fontSize: 9,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 1.1,
                              ),
                            ),
                            const SizedBox(height: 6),
                            const Text(
                              '2',
                              style: TextStyle(
                                color: AppColors.goldPrimary,
                                fontSize: 38,
                                fontWeight: FontWeight.bold,
                                height: 1.0,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Estado simplificado para acompanhamento',
                              style: TextStyle(
                                color: AppColors.creamBeige.withValues(alpha: 0.6),
                                fontSize: 11,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 96,
                        height: 84,
                        decoration: BoxDecoration(
                          gradient: AppColors.goldGradient,
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.add, color: AppColors.bgDark, size: 24),
                            SizedBox(height: 4),
                            Text(
                              'Novo pedido',
                              style: TextStyle(
                                color: AppColors.bgDark,
                                fontWeight: FontWeight.bold,
                                fontSize: 11,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Pedidos ativos',
                      style: TextStyle(
                        color: AppColors.textLight,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Ver todos',
                      style: TextStyle(
                        color: AppColors.goldPrimary.withValues(alpha: 0.9),
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),

                _buildOrderCard(
                  codigo: '#PT-2026-184 · Digital',
                  paciente: 'Mariana Lopes',
                  trabalho: 'Coroa Dissilicato',
                  icone: Icons.insert_drive_file_outlined,
                ),
                const SizedBox(height: 10),
                _buildOrderCard(
                  codigo: '#PT-2026-179 · Físico',
                  paciente: 'João Ferreira',
                  trabalho: 'Prótese Acrílica',
                  icone: Icons.view_in_ar_outlined,
                ),
                const SizedBox(height: 24),

                const Text(
                  'Atualizações recentes',
                  style: TextStyle(
                    color: AppColors.textLight,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 14),

                _buildUpdateItem(
                  icone: Icons.camera_alt_outlined,
                  titulo: 'Novas fotografias de prova',
                  descricao:
                      'O laboratório partilhou conteúdo no pedido #PT-2026-184.',
                  tempo: 'Há 12 min',
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  child: Divider(
                    color: AppColors.creamBeige.withValues(alpha: 0.1),
                    height: 1,
                  ),
                ),
                _buildUpdateItem(
                  icone: Icons.chat_bubble_outline,
                  titulo: 'Nota do laboratório',
                  descricao:
                      '"Solicitamos validação da tonalidade antes de avançar."',
                  tempo: 'Ontem, 18:30',
                ),
                const SizedBox(height: 18),

                Container(
                  width: 38,
                  height: 38,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.surfaceDark.withValues(alpha: 0.65),
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
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.home_outlined,
                  color: AppColors.goldPrimary,
                  size: 22,
                ),
                const SizedBox(height: 4),
                const Text(
                  'Início',
                  style: TextStyle(
                    color: AppColors.goldPrimary,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Container(
                  width: 18,
                  height: 2,
                  color: AppColors.goldPrimary,
                ),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    gradient: AppColors.goldGradient,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(Icons.add, color: AppColors.bgDark, size: 22),
                ),
                const SizedBox(height: 4),
                Text(
                  'Novo',
                  style: TextStyle(
                    color: AppColors.creamBeige.withValues(alpha: 0.6),
                    fontSize: 10,
                  ),
                ),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.chat_bubble_outline,
                  color: AppColors.creamBeige.withValues(alpha: 0.55),
                  size: 20,
                ),
                const SizedBox(height: 4),
                Text(
                  'Mensagens',
                  style: TextStyle(
                    color: AppColors.creamBeige.withValues(alpha: 0.55),
                    fontSize: 10,
                  ),
                ),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.person_outline,
                  color: AppColors.creamBeige.withValues(alpha: 0.55),
                  size: 22,
                ),
                const SizedBox(height: 4),
                Text(
                  'Perfil',
                  style: TextStyle(
                    color: AppColors.creamBeige.withValues(alpha: 0.55),
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTopIcon({
    required IconData icon,
    bool hasBadge = false,
  }) {
    return Stack(
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
    );
  }

  Widget _buildOrderCard({
    required String codigo,
    required String paciente,
    required String trabalho,
    required IconData icone,
  }) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.surfaceDark.withValues(alpha: 0.45),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: AppColors.creamBeige.withValues(alpha: 0.12),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: AppColors.bgDark,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: AppColors.cyanAccent.withValues(alpha: 0.25),
              ),
            ),
            child: Icon(icone, color: AppColors.cyanAccent, size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  codigo,
                  style: TextStyle(
                    color: AppColors.creamBeige.withValues(alpha: 0.5),
                    fontSize: 10,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  paciente,
                  style: const TextStyle(
                    color: AppColors.textLight,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  trabalho,
                  style: TextStyle(
                    color: AppColors.creamBeige.withValues(alpha: 0.65),
                    fontSize: 11,
                  ),
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
                  color: AppColors.cyanAccent.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: AppColors.cyanAccent.withValues(alpha: 0.35),
                  ),
                ),
                child: const Text(
                  'EM PROCESSAMENTO',
                  style: TextStyle(
                    color: AppColors.cyanAccent,
                    fontSize: 8,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Icon(
                Icons.chevron_right,
                color: AppColors.creamBeige.withValues(alpha: 0.45),
                size: 18,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildUpdateItem({
    required IconData icone,
    required String titulo,
    required String descricao,
    required String tempo,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: AppColors.surfaceDark.withValues(alpha: 0.6),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: AppColors.creamBeige.withValues(alpha: 0.12),
            ),
          ),
          child: Icon(icone, color: AppColors.cyanAccent, size: 18),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                titulo,
                style: const TextStyle(
                  color: AppColors.textLight,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
              const SizedBox(height: 3),
              Text(
                descricao,
                style: TextStyle(
                  color: AppColors.creamBeige.withValues(alpha: 0.65),
                  fontSize: 11,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                tempo,
                style: TextStyle(
                  color: AppColors.creamBeige.withValues(alpha: 0.45),
                  fontSize: 10,
                ),
              ),
            ],
          ),
        ),
        Container(
          width: 7,
          height: 7,
          margin: const EdgeInsets.only(top: 4),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.cyanAccent,
          ),
        ),
      ],
    );
  }
}