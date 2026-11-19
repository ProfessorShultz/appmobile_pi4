import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

class AuthApiException implements Exception {
  const AuthApiException(this.message);

  final String message;

  @override
  String toString() => message;
}

class AuthenticatedUser {
  const AuthenticatedUser({
    required this.id,
    required this.email,
    required this.profile,
    required this.permissions,
  });

  final int id;
  final String email;
  final String? profile;
  final List<String> permissions;
}

class AuthSession {
  const AuthSession({
    required this.accessToken,
    required this.refreshToken,
    required this.user,
  });

  final String accessToken;
  final String refreshToken;
  final AuthenticatedUser user;
}

class AuthApi {
  AuthApi({http.Client? client, Uri? baseUri})
    : _client = client ?? http.Client(),
      _baseUri = _withTrailingSlash(
        baseUri ??
            Uri.parse(
              const String.fromEnvironment(
                'API_BASE_URL',
                defaultValue: 'http://127.0.0.1:8000/api/v1/',
              ),
            ),
      );

  static final AuthApi instance = AuthApi();
  static AuthSession? currentSession;

  static const _requestTimeout = Duration(seconds: 15);

  final http.Client _client;
  final Uri _baseUri;

  Future<AuthSession> login({
    required String email,
    required String password,
  }) async {
    final tokenResponse = await _send(
      _client.post(
        _endpoint('auth/token/'),
        headers: const {'Content-Type': 'application/json'},
        body: jsonEncode({'email': email.trim(), 'password': password}),
      ),
    );
    final tokenData = _readResponseObject(tokenResponse);
    final accessToken = tokenData['access'];
    final refreshToken = tokenData['refresh'];
    if (accessToken is! String ||
        accessToken.isEmpty ||
        refreshToken is! String ||
        refreshToken.isEmpty) {
      throw const AuthApiException('A API devolveu tokens inválidos.');
    }

    final profileResponse = await _send(
      _client.get(
        _endpoint('auth/me/'),
        headers: {'Authorization': 'Bearer $accessToken'},
      ),
    );
    final profileData = _readResponseObject(profileResponse);
    final id = profileData['id'];
    final userEmail = profileData['email'];
    final profile = profileData['perfil'];
    final permissions = profileData['permissoes'];
    if (id is! int ||
        userEmail is! String ||
        (profile != null && profile is! String) ||
        permissions is! List ||
        permissions.any((permission) => permission is! String)) {
      throw const AuthApiException('A API devolveu um perfil inválido.');
    }

    final session = AuthSession(
      accessToken: accessToken,
      refreshToken: refreshToken,
      user: AuthenticatedUser(
        id: id,
        email: userEmail,
        profile: profile is String ? profile : null,
        permissions: List<String>.from(permissions),
      ),
    );
    currentSession = session;
    return session;
  }

  Uri _endpoint(String path) => _baseUri.resolve(path);

  Future<http.Response> _send(Future<http.Response> request) async {
    try {
      return await request.timeout(_requestTimeout);
    } on TimeoutException {
      throw const AuthApiException('A ligação à API excedeu o tempo limite.');
    } on http.ClientException {
      throw const AuthApiException(
        'Não foi possível contactar a API. Confirma se o backend está ativo.',
      );
    }
  }

  Map<String, dynamic> _readResponseObject(http.Response response) {
    final Object? decoded;
    try {
      decoded = jsonDecode(response.body);
    } on FormatException {
      throw const AuthApiException('A API devolveu uma resposta inválida.');
    }
    if (decoded is! Map<String, dynamic>) {
      throw const AuthApiException('A API devolveu uma resposta inválida.');
    }
    if (response.statusCode < 200 || response.statusCode >= 300) {
      final detail = decoded['detail'];
      throw AuthApiException(
        detail is String
            ? detail
            : 'A API recusou o pedido (${response.statusCode}).',
      );
    }
    return decoded;
  }

  static Uri _withTrailingSlash(Uri uri) {
    if (uri.path.endsWith('/')) {
      return uri;
    }
    return uri.replace(path: '${uri.path}/');
  }
}
