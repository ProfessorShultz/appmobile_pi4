// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';

import 'package:ficha7_app/main.dart';

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
}
