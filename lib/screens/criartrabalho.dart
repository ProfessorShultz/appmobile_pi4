import 'package:material_ui/material_ui.dart';

class CriarTrabalhoAdminPage extends StatefulWidget {
  const CriarTrabalhoAdminPage({super.key});

  @override
  State<CriarTrabalhoAdminPage> createState() => _CriarTrabalhoAdminPageState();
}

class _CriarTrabalhoAdminPageState extends State<CriarTrabalhoAdminPage> {
  // Controladores e Estados
  final TextEditingController _pacienteController = TextEditingController();
  final TextEditingController _materialController = TextEditingController();
  final TextEditingController _notasController = TextEditingController();
  final TextEditingController _dataController = TextEditingController();

  String _medicoSelecionado = 'Dra. Inês Matos';
  String _tipoTrabalhoSelecionado = 'Coroa Dissilicato';
  String _fluxo = 'Digital'; // 'Físico' ou 'Digital'

  final List<String> _materiaisList = ['Dissilicato de lítio'];
  final List<int> _dentesSelecionados = [];

  // Paleta de cores oficial
  static const Color bgDark = Color(0xFF0D0D0D);
  static const Color cardDark = Color(0xFF161618);
  static const Color borderDark = Color(0xFF262629);
  static const Color goldPrimary = Color(0xFFD4AF37);
  static const Color goldLight = Color(0xFFF3D06B);
  static const Color textGrey = Color(0xFF8E8E93);
  static const Color cyanAccent = Color(0xFF1EC8C8);

  @override
  void dispose() {
    _pacienteController.dispose();
    _materialController.dispose();
    _notasController.dispose();
    _dataController.dispose();
    super.dispose();
  }

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
                padding: const EdgeInsets.fromLTRB(16, 20, 16, 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildSectionTitle(),
                    const SizedBox(height: 20),
                    _buildPacienteField(),
                    const SizedBox(height: 16),
                    _buildMedicoDropdown(),
                    const SizedBox(height: 16),
                    _buildTipoTrabalhoDropdown(),
                    const SizedBox(height: 16),
                    _buildFluxoSelector(),
                    const SizedBox(height: 16),
                    _buildMateriaisSection(),
                    const SizedBox(height: 20),
                    _buildOdontogramaSection(),
                    const SizedBox(height: 20),
                    _buildDataConsultaField(),
                    const SizedBox(height: 16),
                    _buildNotasField(),
                    const SizedBox(height: 20),
                    _buildUploadCards(),
                    const SizedBox(height: 28),
                    _buildSubmeterButton(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Cabeçalho fixo idêntico às outras páginas
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
                _buildHeaderIcon(Icons.notifications_none_rounded, true),
                const SizedBox(width: 8),
                _buildHeaderIcon(Icons.logout_rounded, false),
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

  Widget _buildHeaderIcon(IconData icon, bool hasBadge) {
    return Container(
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
    );
  }

  Widget _buildSectionTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'CRIAÇÃO ADMINISTRATIVA',
              style: TextStyle(
                color: goldPrimary,
                fontSize: 10,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
              ),
            ),
            SizedBox(height: 4),
            Text(
              'Dados clínicos',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 4),
            Text(
              'Informação para avaliação pelo laboratório.',
              style: TextStyle(color: textGrey, fontSize: 12),
            ),
          ],
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            color: cardDark,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: borderDark),
          ),
          child: const Text(
            'NOVO',
            style: TextStyle(
              color: goldPrimary,
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPacienteField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Nome do paciente *',
          style: TextStyle(
            color: Colors.white70,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 6),
        TextField(
          controller: _pacienteController,
          style: const TextStyle(color: Colors.white, fontSize: 13),
          decoration: InputDecoration(
            filled: true,
            fillColor: cardDark,
            hintText: 'Nome completo',
            hintStyle: TextStyle(
              color: textGrey.withValues(alpha: 0.5),
              fontSize: 13,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: borderDark),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: borderDark),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: goldPrimary, width: 1.5),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMedicoDropdown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Médico responsável',
          style: TextStyle(
            color: Colors.white70,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 6),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: cardDark,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: borderDark),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: _medicoSelecionado,
              dropdownColor: cardDark,
              icon: const Icon(Icons.keyboard_arrow_down, color: textGrey),
              style: const TextStyle(color: Colors.white, fontSize: 13),
              items: [
                'Dra. Inês Matos',
                'Dr. Tomás Reis',
                'Dra. Rita Alves',
                'Dr. Carlos Silva',
              ].map((m) => DropdownMenuItem(value: m, child: Text(m))).toList(),
              onChanged: (val) => setState(() => _medicoSelecionado = val!),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTipoTrabalhoDropdown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Tipo de trabalho',
          style: TextStyle(
            color: Colors.white70,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 6),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: cardDark,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: borderDark),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: _tipoTrabalhoSelecionado,
              dropdownColor: cardDark,
              icon: const Icon(Icons.keyboard_arrow_down, color: textGrey),
              style: const TextStyle(color: Colors.white, fontSize: 13),
              items: [
                'Coroa Dissilicato',
                'Prótese Acrílica',
                'Prótese Esquelética',
                'Provisório CAD/CAM',
              ].map((t) => DropdownMenuItem(value: t, child: Text(t))).toList(),
              onChanged: (val) =>
                  setState(() => _tipoTrabalhoSelecionado = val!),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFluxoSelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Fluxo',
          style: TextStyle(
            color: Colors.white70,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 6),
        Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () => setState(() => _fluxo = 'Físico'),
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                    color: _fluxo == 'Físico' ? cardDark : Colors.transparent,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: _fluxo == 'Físico' ? goldPrimary : borderDark,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Físico',
                      style: TextStyle(
                        color: _fluxo == 'Físico' ? goldPrimary : textGrey,
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: GestureDetector(
                onTap: () => setState(() => _fluxo = 'Digital'),
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                    color: _fluxo == 'Digital' ? cardDark : Colors.transparent,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: _fluxo == 'Digital' ? goldPrimary : borderDark,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Digital',
                      style: TextStyle(
                        color: _fluxo == 'Digital' ? goldPrimary : textGrey,
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildMateriaisSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Materiais necessários *',
          style: TextStyle(
            color: Colors.white70,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 6),
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: _materialController,
                style: const TextStyle(color: Colors.white, fontSize: 13),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: cardDark,
                  hintText: 'Escreva o material',
                  hintStyle: TextStyle(
                    color: textGrey.withValues(alpha: 0.5),
                    fontSize: 13,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: borderDark),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: borderDark),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            ElevatedButton(
              onPressed: () {
                if (_materialController.text.isNotEmpty) {
                  setState(() {
                    _materiaisList.add(_materialController.text);
                    _materialController.clear();
                  });
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: cardDark,
                side: const BorderSide(color: borderDark),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 14,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                'Adicionar',
                style: TextStyle(
                  color: goldPrimary,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        if (_materiaisList.isNotEmpty) ...[
          const SizedBox(height: 10),
          Wrap(
            spacing: 8,
            runSpacing: 4,
            children: _materiaisList
                .map(
                  (material) => InputChip(
                    label: Text(material),
                    labelStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                    ),
                    backgroundColor: cardDark,
                    side: const BorderSide(color: borderDark),
                    onDeleted: () {
                      setState(() => _materiaisList.remove(material));
                    },
                  ),
                )
                .toList(),
          ),
        ],
      ],
    );
  }

  Widget _buildOdontogramaSection() {
    const dentes = [
      18,
      17,
      16,
      15,
      14,
      13,
      12,
      11,
      21,
      22,
      23,
      24,
      25,
      26,
      27,
      28,
      38,
      37,
      36,
      35,
      34,
      33,
      32,
      31,
      41,
      42,
      43,
      44,
      45,
      46,
      47,
      48,
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Dentes envolvidos',
          style: TextStyle(
            color: Colors.white70,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 6,
          runSpacing: 2,
          children: dentes.map(_buildToothSelector).toList(),
        ),
      ],
    );
  }

  Widget _buildToothSelector(int number) {
    final selected = _dentesSelecionados.contains(number);
    return ChoiceChip(
      label: Text('$number'),
      selected: selected,
      selectedColor: cyanAccent,
      backgroundColor: cardDark,
      side: BorderSide(color: selected ? cyanAccent : borderDark),
      labelStyle: TextStyle(
        color: selected ? Colors.black : Colors.white70,
        fontSize: 11,
      ),
      onSelected: (value) {
        setState(() {
          if (value) {
            _dentesSelecionados.add(number);
          } else {
            _dentesSelecionados.remove(number);
          }
        });
      },
    );
  }

  Widget _buildDataConsultaField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Data de entrega prevista',
          style: TextStyle(
            color: Colors.white70,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 6),
        TextField(
          controller: _dataController,
          readOnly: true,
          onTap: _selecionarData,
          style: const TextStyle(color: Colors.white, fontSize: 13),
          decoration: InputDecoration(
            filled: true,
            fillColor: cardDark,
            hintText: 'Selecionar data',
            hintStyle: const TextStyle(color: textGrey, fontSize: 13),
            prefixIcon: const Icon(
              Icons.calendar_today_outlined,
              color: textGrey,
              size: 18,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: borderDark),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: borderDark),
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _selecionarData() async {
    final data = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (data != null) {
      _dataController.text =
          '${data.day.toString().padLeft(2, '0')}/${data.month.toString().padLeft(2, '0')}/${data.year}';
    }
  }

  Widget _buildNotasField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Notas adicionais',
          style: TextStyle(
            color: Colors.white70,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 6),
        TextField(
          controller: _notasController,
          minLines: 3,
          maxLines: 5,
          style: const TextStyle(color: Colors.white, fontSize: 13),
          decoration: InputDecoration(
            filled: true,
            fillColor: cardDark,
            hintText: 'Indicações ou observações clínicas',
            hintStyle: const TextStyle(color: textGrey, fontSize: 13),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: borderDark),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: borderDark),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildUploadCards() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Ficheiros de apoio',
          style: TextStyle(
            color: Colors.white70,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: _buildUploadCard(
                Icons.add_photo_alternate_outlined,
                'Imagem',
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: _buildUploadCard(Icons.attach_file, 'Outro ficheiro'),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildUploadCard(IconData icon, String label) {
    return InkWell(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'O carregamento de ficheiros ainda não está disponível.',
            ),
          ),
        );
      },
      borderRadius: BorderRadius.circular(12),
      child: Container(
        height: 82,
        decoration: BoxDecoration(
          color: cardDark,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: borderDark),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: goldPrimary),
            const SizedBox(height: 6),
            Text(label, style: const TextStyle(color: textGrey, fontSize: 11)),
          ],
        ),
      ),
    );
  }

  Widget _buildSubmeterButton() {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: ElevatedButton(
        onPressed: _submeterTrabalho,
        style: ElevatedButton.styleFrom(
          backgroundColor: goldPrimary,
          foregroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: const Text(
          'Submeter trabalho',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        ),
      ),
    );
  }

  void _submeterTrabalho() {
    if (_pacienteController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Indica o nome do paciente antes de submeter.'),
        ),
      );
      return;
    }
    if (_materiaisList.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Adiciona pelo menos um material antes de submeter.'),
        ),
      );
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Formulário preenchido. O envio ainda não está ligado ao sistema.',
        ),
      ),
    );
  }
}
