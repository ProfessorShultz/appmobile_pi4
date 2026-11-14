import 'package:flutter/material.dart';
import 'screens/paginaprincipal.dart';
import 'screens/login_screen.dart';
import 'screens/homecliente.dart';
import 'theme/app_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Laboratório Catarina Domingos',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: AppColors.bgDark,
        fontFamily: 'Roboto',
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const PaginaPrincipal(),
        '/login': (context) => const LoginScreen(),
        '/homecliente': (context) => const HomeCliente(),
      },
    );
  }
}