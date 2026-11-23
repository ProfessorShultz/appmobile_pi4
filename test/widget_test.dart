// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:ficha7_app/main.dart';
import 'package:ficha7_app/pages/app_route.dart';
import 'package:ficha7_app/pages/cliente/pagina_principal.dart';
import 'package:ficha7_app/pages/screens/home_admin.dart';
import 'package:ficha7_app/pages/screens/login_screen.dart';
import 'package:ficha7_app/pages/services/auth_api.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';

void main() {
  testWidgets('Shows the institutional landing page', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('RECEÇÃO DIGITAL'), findsOneWidget);
  });

  testWidgets('Navigates to login when tapping the sign-in button', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());
    await tester.ensureVisible(find.text('Iniciar sessão'));
    await tester.tap(find.text('Iniciar sessão'));
    await tester.pumpAndSettle();

    expect(find.text('Bem-vindo de volta'), findsOneWidget);
  });

  testWidgets('Signs in with the API and opens the administrator page', (
    WidgetTester tester,
  ) async {
    final client = MockClient((request) async {
      if (request.url.path == '/api/v1/auth/token/') {
        return http.Response(
          jsonEncode({'access': 'access-token', 'refresh': 'refresh-token'}),
          200,
        );
      }
      return http.Response(
        jsonEncode({
          'id': 42,
          'email': 'admin@example.com',
          'perfil': 'administrador',
          'permissoes': <String>[],
        }),
        200,
      );
    });
    addTearDown(client.close);
    addTearDown(() => AuthApi.currentSession = null);

    await tester.pumpWidget(
      MaterialApp(
        home: LoginScreen(
          authApi: AuthApi(
            client: client,
            baseUri: Uri.parse('https://api.example.test/api/v1/'),
          ),
        ),
        routes: {AppRoutes.adminPath: (_) => const HomeAdminPage()},
      ),
    );
    await tester.enterText(
      find.byKey(const ValueKey('login-email')),
      'admin@example.com',
    );
    await tester.enterText(
      find.byKey(const ValueKey('login-password')),
      'secret',
    );
    await tester.ensureVisible(find.text('Aceder ao sistema'));
    await tester.tap(find.text('Aceder ao sistema'));
    await tester.pumpAndSettle();

    expect(find.byType(HomeAdminPage), findsOneWidget);
    expect(AuthApi.currentSession?.user.email, 'admin@example.com');
  });

  testWidgets('Signs in with the API and opens the client portal', (
    WidgetTester tester,
  ) async {
    final client = MockClient((request) async {
      if (request.url.path == '/api/v1/auth/token/') {
        return http.Response(
          jsonEncode({'access': 'access-token', 'refresh': 'refresh-token'}),
          200,
        );
      }
      return http.Response(
        jsonEncode({
          'id': 43,
          'email': 'cliente@example.com',
          'perfil': 'cliente',
          'permissoes': <String>[],
        }),
        200,
      );
    });
    addTearDown(client.close);
    addTearDown(() => AuthApi.currentSession = null);

    await tester.pumpWidget(
      MaterialApp(
        home: LoginScreen(
          authApi: AuthApi(
            client: client,
            baseUri: Uri.parse('https://api.example.test/api/v1/'),
          ),
        ),
        routes: {AppRoutes.clientPath: (_) => const PortalClinicaPage()},
      ),
    );
    await tester.tap(find.text('Cliente'));
    await tester.pump();
    await tester.enterText(
      find.byKey(const ValueKey('login-email')),
      'cliente@example.com',
    );
    await tester.enterText(
      find.byKey(const ValueKey('login-password')),
      'secret',
    );
    await tester.ensureVisible(find.text('Aceder ao sistema'));
    await tester.tap(find.text('Aceder ao sistema'));
    await tester.pumpAndSettle();

    expect(find.byType(PortalClinicaPage), findsOneWidget);
    expect(find.text('PORTAL DA CLÍNICA'), findsOneWidget);
    expect(find.textContaining('este perfil ainda não tem'), findsNothing);
  });
}
