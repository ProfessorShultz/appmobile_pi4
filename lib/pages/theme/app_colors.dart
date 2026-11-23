import 'package:material_ui/material_ui.dart';

class AppColors {
  // Paleta de cores fornecida
  static const Color goldDark = Color(
    0xFF926D4B,
  ); // #926D4B - Dourado escuro / Bronze
  static const Color goldPrimary = Color(
    0xFFCA9C68,
  ); // #CA9C68 - Dourado principal
  static const Color creamBeige = Color(
    0xFFD7C9AE,
  ); // #D7C9AE - Bege / Texto secundário
  static const Color surfaceDark = Color(
    0xFF2B2F2E,
  ); // #2B2F2E - Fundo de cartões e inputs
  static const Color bgDark = Color(
    0xFF191B1D,
  ); // #191B1D - Fundo principal escuro
  static const Color textLight = Color(
    0xFFE9DFD5,
  ); // #E9DFD5 - Texto claro principal
  static const Color cyanAccent = Color(0xFF1EC8C8);
  static const Color greenOnline = Color(0xFF4CAF50);

  static const Color portalBgDark = Color(0xFF0A0A0A);
  static const Color portalSurfaceDark = Color(0xFF141414);
  static const Color portalCardDark = Color(0xFF1A1710);
  static const Color portalBorderSubtle = Color(0xFF2B2619);
  static const Color portalGold = Color(0xFFD4AF37);
  static const Color portalCyan = Color(0xFF00BCD4);
  static const Color portalTextMuted = Color(0xFF9E9E9E);
  static const Color portalRoleBackground = Color(0xFF062A30);
  static const Color portalAvatarBackground = Color(0xFF231D0E);
  static const Color portalUpdateBackground = Color(0xFF1A1D21);
  static const Color portalDescriptionText = Color(0xFFBDBDBD);
  static const Color portalTimestampText = Color(0xFF8E8E8E);
  static const Color portalTextPrimary = Color(0xFFFFFFFF);
  static const Color portalTextOnAccent = Color(0xFF000000);
  static const Color portalBorderLight = Color(0x1FFFFFFF);
  static const Color portalBorderFaint = Color(0x1AFFFFFF);
  static const Color portalTextSecondary = Color(0xB3FFFFFF);

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
