import 'package:flutter/material.dart';
import 'package:nexplay/features/games/views/game_list.dart';
import 'core/util.dart';
import 'core/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = createTextTheme(context, "Roboto", "Roboto");

    MaterialTheme theme = MaterialTheme(textTheme);

    return MaterialApp(
      title: 'Nexplay',
      theme: theme.light(),
      home: GameList(),
    );
  }
}
