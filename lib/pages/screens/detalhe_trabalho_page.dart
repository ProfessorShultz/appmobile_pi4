import 'package:material_ui/material_ui.dart';

class DetalheTrabalhoPage extends StatelessWidget {
  // Parâmetros dinâmicos passados a partir da lista de trabalhos
  final String codigo;
  final String cliente;
  final String tipoTrabalho;
  final String medico;
  final String dataEntrega;
  final String estado;
  final Color corEstado;

  const DetalheTrabalhoPage({
    super.key,
    required this.codigo,
    required this.cliente,
    required this.tipoTrabalho,
    required this.medico,
    required this.dataEntrega,
    required this.estado,
    required this.corEstado,
  });

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
            _buildTopNavBar(context),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildHeaderCard(),
                    const SizedBox(height: 20),
                    _buildInfoSecao(
                      titulo: 'Informações Clínicas',
                      filhos: [
                        _buildInfoRow('Cliente / Paciente', cliente),
                        _buildInfoRow('Médico Responsável', medico),
                        _buildInfoRow('Tipo de Trabalho', tipoTrabalho),
                        _buildInfoRow('Data Limite', dataEntrega),
                      ],
                    ),
                    const SizedBox(height: 20),
                    _buildInfoSecao(
                      titulo: 'Registo de Atividade / Histórico',
                      filhos: [
                        _buildHistoricoItem(
                          etapa: 'Estado Atual',
                          detalhe: 'Trabalho marcado como $estado',
                          data: 'Atualizado recentemente',
                        ),
                        _buildHistoricoItem(
                          etapa: 'Registo Inicial',
                          detalhe: 'Criado no sistema laboratorial',
                          data: codigo,
                        ),
                      ],
                    ),
                    const SizedBox(height: 28),
                    _buildActionButtons(context),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Barra superior com Botão de Voltar e Título
  Widget _buildTopNavBar(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: const BoxDecoration(
        color: bgDark,
        border: Border(bottom: BorderSide(color: borderDark, width: 1)),
      ),
      child: Row(
        children: [
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
                size: 18,
              ),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          const SizedBox(width: 16),
          const Text(
            'Detalhes do Trabalho',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  /// Cartão Principal de Resumo (Código + Estado)
  Widget _buildHeaderCard() {
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                codigo,
                style: const TextStyle(
                  color: goldPrimary,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.8,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  color: corEstado.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(color: corEstado.withValues(alpha: 0.4)),
                ),
                child: Text(
                  estado.toUpperCase(),
                  style: TextStyle(
                    color: corEstado,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            cliente,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            tipoTrabalho,
            style: const TextStyle(color: textGrey, fontSize: 13),
          ),
        ],
      ),
    );
  }

  /// Secção genérica de detalhes estruturados
  Widget _buildInfoSecao({
    required String titulo,
    required List<Widget> filhos,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          titulo,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: cardDark,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: borderDark),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: filhos,
          ),
        ),
      ],
    );
  }

  /// Linha de detalhe individual
  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(color: textGrey, fontSize: 12)),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  /// Item de histórico
  Widget _buildHistoricoItem({
    required String etapa,
    required String detalhe,
    required String data,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 3),
            child: Icon(
              Icons.fiber_manual_record,
              color: goldPrimary,
              size: 10,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  etapa,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  detalhe,
                  style: const TextStyle(color: textGrey, fontSize: 11),
                ),
              ],
            ),
          ),
          Text(
            data,
            style: TextStyle(
              color: textGrey.withValues(alpha: 0.7),
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }

  /// Botões de Ação na base do ecrã de detalhes
  Widget _buildActionButtons(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton(
            onPressed: () {
              // TODO: Editar trabalho
            },
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: borderDark),
              padding: const EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text(
              'Editar',
              style: TextStyle(color: Colors.white, fontSize: 13),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [goldLight, goldPrimary],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: ElevatedButton(
              onPressed: () {
                // TODO: Alterar estado do trabalho
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                'Atualizar Estado',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
