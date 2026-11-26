import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../route_names.dart';
import '../services/auth_api.dart';


class CriarNovoClienteScreen extends StatefulWidget {
  const CriarNovoClienteScreen({super.key});

  @override
  State<CriarNovoClienteScreen> createState() => _CriarNovoClienteScreenState();
}

class _CriarNovoClienteScreenState extends State<CriarNovoClienteScreen> {
  final _formKey = GlobalKey<FormState>();

  final _nomePacienteController = TextEditingController();
  final _materialController = TextEditingController();
  final _dataConsultaController = TextEditingController();
  final _notasController = TextEditingController();

  String _medicoResponsavel = 'Dra. Inês Matos';
  String _tipoTrabalho = 'Coroa Dissilicato';
  String _fluxoSelecionado = 'Digital';

  final List<String> _medicos = [
    'Dra. Inês Matos',
    'Dr. João Almeida',
    'Dra. Sofia Costa',
  ];

  final List<String> _tiposTrabalho = [
    'Coroa Dissilicato',
    'Prótese Acrílica',
    'Faceta Cerâmica',
    'Reabilitação sobre Implante',
  ];

  final List<String> _materiais = ['Dissilicato de lítio'];
  final Set<int> _dentesSelecionados = {};

  String? _ficheiroFotografias;
  String? _ficheiroStl;

  // Quadrantes principais do odontograma (18..11, 21..28, 38..31, 48..41)
  final List<int> _dentesOdontograma = [
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
    48,
    47,
    46,
    45,
    44,
    43,
    42,
    41,
    31,
    32,
    33,
    34,
    35,
    36,
    37,
    38,
  ];

  @override
  void dispose() {
    _nomePacienteController.dispose();
    _materialController.dispose();
    _dataConsultaController.dispose();
    _notasController.dispose();
    super.dispose();
  }

  void _adicionarMaterial() {
    final texto = _materialController.text.trim();
    if (texto.isNotEmpty && !_materiais.contains(texto)) {
      setState(() {
        _materiais.add(texto);
        _materialController.clear();
      });
    }
  }

  Future<void> _selecionarData() async {
    final hoje = DateTime.now();
    final escolhida = await showDatePicker(
      context: context,
      initialDate: hoje,
      firstDate: hoje,
      lastDate: DateTime(hoje.year + 3),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.dark(
              primary: AppColors.goldPrimary,
              onPrimary: AppColors.background,
              surface: AppColors.surface,
              onSurface: AppColors.textPrimary,
            ),
          ),
          child: child!,
        );
      },
    );

    if (escolhida != null) {
      final dia = escolhida.day.toString().padLeft(2, '0');
      final mes = escolhida.month.toString().padLeft(2, '0');
      final ano = escolhida.year.toString();
      setState(() {
        _dataConsultaController.text = '$dia/$mes/$ano';
      });
    }
  }

  void _submeterPedido() {
    if (!_formKey.currentState!.validate()) return;

    if (_materiais.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Adicione pelo menos um material necessário.'),
        ),
      );
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Pedido de ${_nomePacienteController.text.trim()} ($_fluxoSelecionado) submetido com sucesso!',
        ),
      ),
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 36),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Cabeçalho de secção
                const Text(
                  'NOVO PEDIDO',
                  style: TextStyle(
                    color: AppColors.goldPrimary,
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1,
                  ),
                ),
                const SizedBox(height: 6),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Dados clínicos',
                      style: TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.goldPrimary.withValues(alpha: 0.14),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: AppColors.goldPrimary.withValues(alpha: 0.45),
                        ),
                      ),
                      child: const Text(
                        'NOVO',
                        style: TextStyle(
                          color: AppColors.goldPrimary,
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.6,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                const Text(
                  'Informação para avaliação pelo laboratório.',
                  style: TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 24),

                // Nome do paciente *
                const _FieldLabel('Nome do paciente *'),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _nomePacienteController,
                  style: const TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 14,
                  ),
                  decoration: _inputDecoration(hint: 'Nome completo'),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Indique o nome do paciente.';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),

                // Médico responsável
                const _FieldLabel('Médico responsável'),
                const SizedBox(height: 8),
                DropdownButtonFormField<String>(
                  initialValue: _medicoResponsavel,
                  dropdownColor: AppColors.surface,
                  icon: const Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: AppColors.textSecondary,
                  ),
                  style: const TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 14,
                  ),
                  decoration: _inputDecoration(),
                  items: _medicos
                      .map(
                        (medico) => DropdownMenuItem(
                          value: medico,
                          child: Text(medico),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    if (value != null) {
                      setState(() => _medicoResponsavel = value);
                    }
                  },
                ),
                const SizedBox(height: 20),

                // Tipo de trabalho
                const _FieldLabel('Tipo de trabalho'),
                const SizedBox(height: 8),
                DropdownButtonFormField<String>(
                  initialValue: _tipoTrabalho,
                  dropdownColor: AppColors.surface,
                  icon: const Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: AppColors.textSecondary,
                  ),
                  style: const TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 14,
                  ),
                  decoration: _inputDecoration(),
                  items: _tiposTrabalho
                      .map(
                        (tipo) =>
                            DropdownMenuItem(value: tipo, child: Text(tipo)),
                      )
                      .toList(),
                  onChanged: (value) {
                    if (value != null) {
                      setState(() => _tipoTrabalho = value);
                    }
                  },
                ),
                const SizedBox(height: 20),

                // Fluxo (Físico / Digital)
                const _FieldLabel('Fluxo'),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: AppColors.border),
                  ),
                  child: Row(
                    children: [
                      _buildFluxoOption('Físico'),
                      _buildFluxoOption('Digital'),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                // Materiais necessários *
                const _FieldLabel('Materiais necessários *'),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _materialController,
                        style: const TextStyle(
                          color: AppColors.textPrimary,
                          fontSize: 14,
                        ),
                        decoration: _inputDecoration(
                          hint: 'Escreva o material',
                        ),
                        onSubmitted: (_) => _adicionarMaterial(),
                      ),
                    ),
                    const SizedBox(width: 10),
                    SizedBox(
                      height: 52,
                      child: OutlinedButton(
                        onPressed: _adicionarMaterial,
                        style: OutlinedButton.styleFrom(
                          backgroundColor: AppColors.goldPrimary.withValues(
                            alpha: 0.12,
                          ),
                          foregroundColor: AppColors.goldPrimary,
                          side: BorderSide(
                            color: AppColors.goldPrimary.withValues(alpha: 0.4),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 18),
                        ),
                        child: const Text(
                          'Adicionar',
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  ],
                ),
                if (_materiais.isNotEmpty) ...[
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: _materiais.map((material) {
                      return Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.goldPrimary.withValues(alpha: 0.12),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: AppColors.goldPrimary.withValues(
                              alpha: 0.35,
                            ),
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              material,
                              style: const TextStyle(
                                color: AppColors.goldLight,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(width: 8),
                            GestureDetector(
                              onTap: () {
                                setState(() => _materiais.remove(material));
                              },
                              child: const Icon(
                                Icons.close_rounded,
                                size: 15,
                                color: AppColors.textSecondary,
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ],
                const SizedBox(height: 24),

                // Odontograma - opcional
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Odontograma - opcional',
                      style: TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      '${_dentesSelecionados.length} selecionados',
                      style: const TextStyle(
                        color: AppColors.cyanPrimary,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                const Text(
                  'Selecione dentes apenas quando forem relevantes.',
                  style: TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  height: 92,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: _dentesOdontograma.length,
                    separatorBuilder: (_, __) => const SizedBox(width: 8),
                    itemBuilder: (context, index) {
                      final dente = _dentesOdontograma[index];
                      final selecionado = _dentesSelecionados.contains(dente);
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            if (selecionado) {
                              _dentesSelecionados.remove(dente);
                            } else {
                              _dentesSelecionados.add(dente);
                            }
                          });
                        },
                        child: Container(
                          width: 66,
                          decoration: BoxDecoration(
                            color: selecionado
                                ? AppColors.goldPrimary.withValues(alpha: 0.16)
                                : AppColors.surface,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: selecionado
                                  ? AppColors.goldPrimary
                                  : AppColors.border,
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.spa_outlined,
                                size: 28,
                                color: selecionado
                                    ? AppColors.goldPrimary
                                    : AppColors.textSecondary,
                              ),
                              const SizedBox(height: 6),
                              Text(
                                '$dente',
                                style: TextStyle(
                                  color: selecionado
                                      ? AppColors.goldLight
                                      : AppColors.textSecondary,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 24),

                // Próxima consulta
                const _FieldLabel('Próxima consulta'),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _dataConsultaController,
                  readOnly: true,
                  onTap: _selecionarData,
                  style: const TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 14,
                  ),
                  decoration: _inputDecoration(
                    hint: 'dd/mm/aaaa',
                    suffixIcon: const Icon(
                      Icons.calendar_today_outlined,
                      color: AppColors.textSecondary,
                      size: 18,
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Notas para o laboratório
                const _FieldLabel('Notas para o laboratório'),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _notasController,
                  maxLines: 4,
                  style: const TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 14,
                  ),
                  decoration: _inputDecoration(
                    hint: 'Indicações clínicas, cor e observações...',
                  ),
                ),
                const SizedBox(height: 20),

                // Upload de Fotografias e Ficheiro STL
                Row(
                  children: [
                    Expanded(
                      child: _buildUploadCard(
                        icon: Icons.camera_alt_outlined,
                        title: _ficheiroFotografias ?? 'Fotografias',
                        subtitle: 'JPG / PNG',
                        onTap: () {
                          setState(() {
                            _ficheiroFotografias = 'prova_cor_01.jpg';
                          });
                        },
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _buildUploadCard(
                        icon: Icons.insert_drive_file_outlined,
                        title: _ficheiroStl ?? 'Ficheiro STL',
                        subtitle: 'Digital',
                        onTap: () {
                          setState(() {
                            _ficheiroStl = 'arcada_superior.stl';
                          });
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                // Botão principal Submeter pedido
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: _submeterPedido,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.goldPrimary,
                      foregroundColor: AppColors.background,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Submeter pedido',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(width: 10),
                        Icon(Icons.arrow_forward_rounded, size: 20),
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

  Widget _buildFluxoOption(String label) {
    final selecionado = _fluxoSelecionado == label;
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => _fluxoSelecionado = label),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 14),
          decoration: BoxDecoration(
            color: selecionado
                ? AppColors.goldPrimary.withValues(alpha: 0.14)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(10),
            border: selecionado
                ? Border.all(
                    color: AppColors.goldPrimary.withValues(alpha: 0.5),
                  )
                : null,
          ),
          alignment: Alignment.center,
          child: Text(
            label,
            style: TextStyle(
              color: selecionado
                  ? AppColors.goldLight
                  : AppColors.textSecondary,
              fontSize: 13,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildUploadCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: AppColors.border),
        ),
        child: Column(
          children: [
            Icon(icon, color: AppColors.goldPrimary, size: 24),
            const SizedBox(height: 10),
            Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: AppColors.textPrimary,
                fontSize: 13,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 3),
            Text(
              subtitle,
              style: const TextStyle(
                color: AppColors.textSecondary,
                fontSize: 11,
              ),
            ),
          ],
        ),
      ),
    );
  }

  InputDecoration _inputDecoration({String? hint, Widget? suffixIcon}) {
    return InputDecoration(
      hintText: hint,
      hintStyle: const TextStyle(color: AppColors.textSecondary, fontSize: 13),
      suffixIcon: suffixIcon,
      filled: true,
      fillColor: AppColors.surface,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: AppColors.border),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: AppColors.border),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: AppColors.goldPrimary),
      ),
    );
  }
}

class _FieldLabel extends StatelessWidget {
  const _FieldLabel(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        color: AppColors.textPrimary,
        fontSize: 13,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
