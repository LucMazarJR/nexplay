import 'package:flutter/material.dart';
import 'package:nexplay/features/games/models/enum/game_status.dart';

extension GameStatusStyle on GameStatus {
  Color get backgroundColor => switch (this) {
    GameStatus.novo => Colors.blue[300] ?? Colors.blue,
    GameStatus.nenhum => Colors.white,
    GameStatus.continuar => Colors.orange[300] ?? Colors.orange,
    GameStatus.jogando => Colors.purple[300] ?? Colors.purple,
    GameStatus.finalizado => Colors.green[300] ?? Colors.green,
    GameStatus.abandonado => Colors.grey[300] ?? Colors.grey,
  };

  Color get textColor => switch (this) {
    GameStatus.novo => Colors.blue[900] ?? Colors.blue,
    GameStatus.nenhum => Colors.white,
    GameStatus.continuar => Colors.orange[900] ?? Colors.orange,
    GameStatus.jogando => Colors.purple[900] ?? Colors.purple,
    GameStatus.finalizado => Colors.green[900] ?? Colors.green,
    GameStatus.abandonado => Colors.grey[900] ?? Colors.grey,
  };
}
