import 'package:go_router/go_router.dart';
import 'package:flutter_application_1/main.dart';

//App route e configurações

class AppRoutes{
  
  static const string splashPath = '/';




  // Define the routes for the application
  static final GoRouter router = GoRouter(
    router:[
      GoRoute(
        path: splashPath,
        builder: (context, state) => const SplashPage(),
      )
      GoRoute(path:)
    ],
  );
}