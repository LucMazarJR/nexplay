import 'package:flutter/material.dart';
import 'package:nexplay/core/theme/app_theme.dart';
import 'package:nexplay/features/home/view/home_page.dart';
import 'package:nexplay/features/auth/view/login_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      home: const LoginPage(),
    );
  }
}
