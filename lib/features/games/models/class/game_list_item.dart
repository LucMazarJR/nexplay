import 'package:nexplay/features/games/models/enum/add_game_form.dart';

class GameListItem {
  int id;
  String name;
  GameStatus status;
  double? rating;

  GameListItem({
    required this.id,
    required this.name,
    required this.status,
    this.rating,
  });
}
