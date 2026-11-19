import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:ficha7_app/pages/services/auth_api.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';

void main() {
  tearDown(() {
    AuthApi.currentSession = null;
  });

  test('logs in and loads the authenticated profile', () async {
    final requests = <http.BaseRequest>[];
    final client = MockClient((request) async {
      requests.add(request);
      if (request.url.path == '/api/v1/auth/token/') {
        expect(jsonDecode(request.body), {
          'email': 'admin@example.com',
          'password': 'secret',
        });
        return http.Response(
          jsonEncode({'access': 'access-token', 'refresh': 'refresh-token'}),
          200,
        );
      }

      expect(request.url.path, '/api/v1/auth/me/');
      expect(request.headers['Authorization'], 'Bearer access-token');
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
    final api = AuthApi(
      client: client,
      baseUri: Uri.parse('https://api.example.test/api/v1/'),
    );
    addTearDown(client.close);

    final session = await api.login(
      email: ' admin@example.com ',
      password: 'secret',
    );

    expect(requests, hasLength(2));
    expect(session.user.id, 42);
    expect(session.user.profile, 'administrador');
    expect(session.accessToken, 'access-token');
    expect(AuthApi.currentSession, same(session));
  });

  test('surfaces the authentication error returned by the API', () async {
    final client = MockClient(
      (_) async =>
          http.Response(jsonEncode({'detail': 'Credenciais inválidas.'}), 401),
    );
    final api = AuthApi(
      client: client,
      baseUri: Uri.parse('https://api.example.test/api/v1/'),
    );
    addTearDown(client.close);

    await expectLater(
      api.login(email: 'admin@example.com', password: 'wrong'),
      throwsA(
        isA<AuthApiException>().having(
          (error) => error.message,
          'message',
          'Credenciais inválidas.',
        ),
      ),
    );
  });
}
