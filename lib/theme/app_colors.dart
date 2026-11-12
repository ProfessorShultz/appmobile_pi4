import 'package:flutter/material.dart';

class AppColors {
  // Paleta de cores fornecida
  static const Color goldDark = Color(0xFF926D4B);     // #926D4B - Dourado escuro / Bronze
  static const Color goldPrimary = Color(0xFFCA9C68);  // #CA9C68 - Dourado principal
  static const Color creamBeige = Color(0xFFD7C9AE);   // #D7C9AE - Bege / Texto secundário
  static const Color surfaceDark = Color(0xFF2B2F2E);  // #2B2F2E - Fundo de cartões e inputs
  static const Color bgDark = Color(0xFF191B1D);       // #191B1D - Fundo principal escuro
  static const Color textLight = Color(0xFFE9DFD5);    // #E9DFD5 - Texto claro principal

  // Gradiente Dourado (para botões e destaques)
  static const LinearGradient goldGradient = LinearGradient(
    colors: [goldDark, goldPrimary, creamBeige],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  // Gradiente de Fundo (subtil entre os dois tons escuros)
  static const LinearGradient backgroundGradient = LinearGradient(
    colors: [bgDark, surfaceDark],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}