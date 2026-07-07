import 'package:nexplay/features/games/models/class/genres.dart';
import 'package:nexplay/features/games/models/class/tags.dart';
import 'package:nexplay/features/games/models/enum/add_game_form.dart';

class Game {
  final String name;
  final String? imagePath;
  final GameStatus status;
  final Set<Tag>? tags;
  final Genre genre;

  const Game({
    required this.name,
    this.imagePath,
    required this.status,
    this.tags,
    required this.genre,
  });
}
