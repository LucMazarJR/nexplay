class LoginCredentials {
  const LoginCredentials({
    required this.email,
    required this.password,
    required this.keepLoggedIn,
  });

  final String email;
  final String password;
  final bool keepLoggedIn;
}
