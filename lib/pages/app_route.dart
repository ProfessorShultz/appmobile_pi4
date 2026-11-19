import 'package:material_ui/material_ui.dart';

import 'screens/login_screen.dart';
import 'screens/pagina_principal.dart';

class AppRoutes {
  static const String homePath = '/';
  static const String loginPath = '/login';
  static const String mainPath = '/pagina-principal';

  static final Map<String, WidgetBuilder> routes = {
    homePath: (context) => const PaginaPrincipal(),
    loginPath: (context) => const LoginScreen(),
    mainPath: (context) => const PaginaPrincipal(),
  };
}
