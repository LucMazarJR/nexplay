import 'package:flutter/material.dart';
// import 'package:nexplay/features/home/view/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Icon(Icons.sports_esports),
            SizedBox(width: 8),
            Text('NexPlay'),
          ],
        ),
        backgroundColor: Theme.of(context).colorScheme.surface,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final devicePixelRatio = MediaQuery.of(context).devicePixelRatio;
          final cacheWidth = (constraints.maxWidth * devicePixelRatio).round();

          return Expanded(
            child: Stack(
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
                      begin: Alignment(0, -2),
                      end: Alignment(0, 1),
                      colors: [
                        Colors.transparent,
                        Theme.of(context).colorScheme.surface,
                      ],
                    ),
                  ),
                ),
                const Expanded(
                  child: Column(
                    children: [SizedBox(height: 300), Text('LoginPage')],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
