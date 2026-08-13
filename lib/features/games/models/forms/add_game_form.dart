import 'package:nexplay/features/games/models/class/genres.dart';
import 'package:nexplay/features/games/models/class/tags.dart';
import 'package:nexplay/features/games/models/enum/add_game_form.dart';

class GameForm {
  String? name;
  GameStatus status;
  Genre? genre;
  Set<Tag>? tags;
  String? toDoDescription;
  double? rating;
  String? imagePath;

  GameForm(this.status);
}
