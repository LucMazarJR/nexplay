import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:nexplay/features/auth/viewmodel/login_view_model.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  late final LoginViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = LoginViewModel();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _viewModel.dispose();
    super.dispose();
  }

  Future<void> _submitLogin() async {
    if (!(_formKey.currentState?.validate() ?? false)) return;

    final result = await _viewModel.submit(
      email: _emailController.text,
      password: _passwordController.text,
    );

    if (!mounted) return;

    final messenger = ScaffoldMessenger.of(context);
    messenger.showSnackBar(SnackBar(content: Text(result.message)));
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Icon(Icons.sports_esports),
            SizedBox(width: 8),
            Text('NexPlay'),
          ],
        ),
        backgroundColor: colors.surface,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final devicePixelRatio = MediaQuery.of(context).devicePixelRatio;
          final cacheWidth = (constraints.maxWidth * devicePixelRatio).round();
          final isWide = constraints.maxWidth >= 700;

          return Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(
                'assets/images/home_bg.png',
                fit: BoxFit.cover,
                cacheWidth: cacheWidth,
                filterQuality: FilterQuality.medium,
                errorBuilder: (context, error, stackTrace) {
                  return const Center(
                    child: Text('Falha ao carregar imagem de fundo.'),
                  );
                },
              ),
              DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: const Alignment(0, -1.2),
                    end: const Alignment(0, 1),
                    colors: [Colors.transparent, colors.surface],
                  ),
                ),
              ),
              SafeArea(
                child: Center(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(16),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: isWide ? 460 : 560),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 2, sigmaY: 12),
                          child: Container(
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: colors.surface.withValues(alpha: 0.58),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: Colors.white.withValues(alpha: 0.12),
                              ),
                            ),
                            child: AnimatedBuilder(
                              animation: _viewModel,
                              builder: (context, child) {
                                return Form(
                                  key: _formKey,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        'Bem vindo de volta',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineMedium
                                            ?.copyWith(
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                      const SizedBox(height: 6),
                                      Text(
                                        'Insira suas credenciais para entrar',
                                        style: TextStyle(
                                          color: Color.lerp(
                                            colors.onSurface,
                                            Colors.black,
                                            0.5,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 18),
                                      TextFormField(
                                        controller: _emailController,
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        autofillHints: const [
                                          AutofillHints.email,
                                        ],
                                        decoration: InputDecoration(
                                          hintStyle: TextStyle(
                                            color: Color.lerp(
                                              colors.onSurface,
                                              Colors.black,
                                              0.5,
                                            ),
                                          ),
                                          labelText: 'E-mail',
                                          hintText: 'voce@email.com',
                                          prefixIcon: const Icon(
                                            Icons.mail_outline,
                                          ),
                                        ),
                                        validator: _viewModel.validateEmail,
                                      ),
                                      const SizedBox(height: 22),
                                      TextFormField(
                                        controller: _passwordController,
                                        obscureText: _viewModel.obscurePassword,
                                        autofillHints: const [
                                          AutofillHints.password,
                                        ],
                                        decoration: InputDecoration(
                                          labelText: 'Senha',
                                          prefixIcon: const Icon(
                                            Icons.lock_outline,
                                          ),
                                          suffixIcon: IconButton(
                                            onPressed: _viewModel
                                                .toggleObscurePassword,
                                            icon: Icon(
                                              _viewModel.obscurePassword
                                                  ? Icons
                                                        .visibility_off_outlined
                                                  : Icons.visibility_outlined,
                                            ),
                                          ),
                                        ),
                                        validator: _viewModel.validatePassword,
                                      ),
                                      const SizedBox(height: 18),
                                      Theme(
                                        data: Theme.of(context).copyWith(
                                          checkboxTheme: Theme.of(context)
                                              .checkboxTheme
                                              .copyWith(
                                                shape: const CircleBorder(),
                                              ),
                                        ),
                                        child: InkWell(
                                          onTap: () {
                                            _viewModel.setKeepLoggedIn(
                                              !_viewModel.keepLoggedIn,
                                            );
                                          },
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Checkbox(
                                                value: _viewModel.keepLoggedIn,
                                                onChanged: (value) {
                                                  _viewModel.setKeepLoggedIn(
                                                    value ?? false,
                                                  );
                                                },
                                              ),
                                              const SizedBox(width: 2),
                                              const Text('Manter conectado'),
                                            ],
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      SizedBox(
                                        width: double.infinity,
                                        child: FilledButton.icon(
                                          onPressed: _viewModel.isLoading
                                              ? null
                                              : _submitLogin,
                                          icon: _viewModel.isLoading
                                              ? const SizedBox(
                                                  width: 18,
                                                  height: 18,
                                                  child:
                                                      CircularProgressIndicator(
                                                        strokeWidth: 2,
                                                      ),
                                                )
                                              : const Icon(Icons.login),
                                          label: Padding(
                                            padding: const EdgeInsets.symmetric(
                                              vertical: 12,
                                            ),
                                            child: Text(
                                              _viewModel.isLoading
                                                  ? 'Entrando...'
                                                  : 'Entrar',
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 14),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
