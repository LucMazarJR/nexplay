import 'package:firebase_auth/firebase_auth.dart';
import 'package:nexplay/features/auth/model/login_credentials.dart';

class AuthService {
  AuthService({FirebaseAuth? firebaseAuth})
    : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  final FirebaseAuth _firebaseAuth;

  Future<void> login(LoginCredentials credentials) async {
    final email = credentials.email.trim();
    final password = credentials.password;

    if (email.isEmpty || password.isEmpty) {
      throw const AuthException('Preencha e-mail e senha.');
    }

    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (error) {
      throw AuthException(_mapFirebaseError(error.code));
    }
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  String _mapFirebaseError(String code) {
    switch (code) {
      case 'invalid-email':
        return 'E-mail invalido.';
      case 'user-disabled':
        return 'Usuario desativado.';
      case 'user-not-found':
      case 'wrong-password':
      case 'invalid-credential':
        return 'E-mail ou senha incorretos.';
      case 'too-many-requests':
        return 'Muitas tentativas. Tente novamente em instantes.';
      default:
        return 'Nao foi possivel autenticar agora.';
    }
  }
}

class AuthException implements Exception {
  const AuthException(this.message);

  final String message;
}
