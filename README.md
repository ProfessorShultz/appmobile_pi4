# ficha7_app

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Learn Flutter](https://docs.flutter.dev/get-started/learn-flutter)
- [Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Flutter learning resources](https://docs.flutter.dev/reference/learning-resources)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Ligação ao BackOffice

O ecrã de login comunica com a API Django do projeto `PI4-BackOffice`; a app
Flutter não se liga diretamente ao PostgreSQL do Neon. A API usa
`http://127.0.0.1:8000/api/v1/` por omissão e autentica através de
`/auth/token/` e `/auth/me/`.

1. No projeto `PI4-BackOffice`, configura `DATABASE_URL` no `.env` local e
   permite a origem Flutter com `CORS_ALLOWED_ORIGINS`.
2. Inicia o backend com `python manage.py runserver 127.0.0.1:8000`.
3. Inicia esta app com
   `flutter run -d web-server --web-port 7357 --dart-define=API_BASE_URL=http://127.0.0.1:8000/api/v1/`.

Para outro endereço de API, altera `API_BASE_URL` no comando de execução.
Nunca coloques a connection string do Neon no projeto Flutter.
