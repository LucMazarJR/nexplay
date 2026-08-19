import 'package:flutter/material.dart';
import 'package:nexplay/features/games/models/enum/game_status.dart';

extension GameStatusStyle on GameStatus {
  Color get backgroundColor => switch (this) {
    GameStatus.novo => const Color.fromARGB(255, 145, 204, 252),
    GameStatus.nenhum => Colors.white,
    GameStatus.continuar => const Color.fromARGB(255, 254, 191, 97),
    GameStatus.jogando => Colors.purple[300] ?? Colors.purple,
    GameStatus.finalizado => const Color.fromARGB(255, 151, 233, 155),
    GameStatus.abandonado => Colors.grey[300] ?? Colors.grey,
  };

  Color get textColor => switch (this) {
    GameStatus.novo => const Color.fromARGB(255, 0, 40, 101),
    GameStatus.nenhum => Colors.white,
    GameStatus.continuar => const Color.fromARGB(255, 104, 37, 1),
    GameStatus.jogando => Colors.purple[900] ?? Colors.purple,
    GameStatus.finalizado => const Color.fromARGB(255, 11, 45, 13),
    GameStatus.abandonado => Colors.grey[900] ?? Colors.grey,
  };
}
