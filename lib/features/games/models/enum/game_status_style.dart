import 'package:flutter/material.dart';
import 'package:nexplay/features/games/models/enum/game_status.dart';

extension GameStatusStyle on GameStatus {
  Color get backgroundColor => switch (this) {
    GameStatus.novo => Colors.blue,
    GameStatus.nenhum => Colors.blue,
    GameStatus.continuar => Colors.blue,
    GameStatus.jogando => Colors.blue,
    GameStatus.finalizado => Colors.blue,
    GameStatus.abandonado => Colors.blue,
  };

  Color get textColor => switch (this) {
    GameStatus.novo => Colors.blue,
    GameStatus.nenhum => Colors.blue,
    GameStatus.continuar => Colors.blue,
    GameStatus.jogando => Colors.blue,
    GameStatus.finalizado => Colors.blue,
    GameStatus.abandonado => Colors.blue,
  };
}
