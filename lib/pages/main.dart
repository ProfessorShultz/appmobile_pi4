import 'package:material_ui/material_ui.dart';

import 'app_route.dart';
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
      initialRoute: AppRoutes.homePath,
      routes: AppRoutes.routes,
    );
  }
}
