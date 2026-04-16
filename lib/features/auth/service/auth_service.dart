import 'package:nexplay/features/auth/model/login_credentials.dart';

class AuthService {
  Future<void> login(LoginCredentials credentials) async {
    await Future<void>.delayed(const Duration(milliseconds: 600));

    final email = credentials.email.trim();
    final password = credentials.password;

    if (email.isEmpty || password.isEmpty) {
      throw const AuthException('Preencha e-mail e senha.');
    }
  }
}

class AuthException implements Exception {
  const AuthException(this.message);

  final String message;
}
