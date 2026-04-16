import 'package:flutter/foundation.dart';
import 'package:nexplay/features/auth/model/login_credentials.dart';
import 'package:nexplay/features/auth/service/auth_service.dart';

class LoginViewModel extends ChangeNotifier {
  LoginViewModel({AuthService? authService})
    : _authService = authService ?? AuthService();

  final AuthService _authService;

  bool _obscurePassword = true;
  bool _keepLoggedIn = false;
  bool _isLoading = false;

  bool get obscurePassword => _obscurePassword;
  bool get keepLoggedIn => _keepLoggedIn;
  bool get isLoading => _isLoading;

  void toggleObscurePassword() {
    _obscurePassword = !_obscurePassword;
    notifyListeners();
  }

  void setKeepLoggedIn(bool value) {
    _keepLoggedIn = value;
    notifyListeners();
  }

  String? validateEmail(String? value) {
    final text = (value ?? '').trim();
    if (text.isEmpty) return 'Informe e-mail';
    if (!text.contains('@') || !text.contains('.')) {
      return 'E-mail invalido';
    }
    return null;
  }

  String? validatePassword(String? value) {
    final text = value ?? '';
    if (text.isEmpty) return 'Informe sua senha';
    if (text.length < 6) return 'Minimo de 6 caracteres';
    return null;
  }

  Future<LoginResult> submit({
    required String email,
    required String password,
  }) async {
    _isLoading = true;
    notifyListeners();

    try {
      final credentials = LoginCredentials(
        email: email,
        password: password,
        keepLoggedIn: _keepLoggedIn,
      );

      await _authService.login(credentials);

      return const LoginResult.success('Login enviado.');
    } on AuthException catch (error) {
      return LoginResult.failure(error.message);
    } catch (_) {
      return const LoginResult.failure('Falha ao realizar login.');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}

class LoginResult {
  const LoginResult._({required this.isSuccess, required this.message});

  const LoginResult.success(String message)
    : this._(isSuccess: true, message: message);

  const LoginResult.failure(String message)
    : this._(isSuccess: false, message: message);

  final bool isSuccess;
  final String message;
}
