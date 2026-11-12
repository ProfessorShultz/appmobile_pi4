import 'package:flutter/material.dart';
import 'screens/paginaprincipal.dart';
import 'theme/app_colors.dart';

void main() {
  runApp(const LaboratorioApp());
}

class LaboratorioApp extends StatelessWidget {
  const LaboratorioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Laboratório Catarina Domingos',
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.bgDark,
        fontFamily: 'Roboto',
      ),
      home: const PaginaPrincipal(),
    );
  }
}