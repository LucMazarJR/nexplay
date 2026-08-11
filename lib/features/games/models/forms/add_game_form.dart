import 'package:nexplay/features/games/models/class/genres.dart';
import 'package:nexplay/features/games/models/class/tags.dart';
import 'package:nexplay/features/games/models/enum/add_game_form.dart';

class Game {
  String? name;
  GameStatus? status;
  Genre? genre;
  Set<Tag>? tags;
  String? imagePath;

  Game();
}
