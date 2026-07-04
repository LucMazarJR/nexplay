import 'package:nexplay/features/games/models/class/game_genres.dart';
import 'package:nexplay/features/games/models/class/game_tags.dart';
import 'package:nexplay/features/games/models/enum/add_game_form.dart';

class Game {
  final String name;
  final String? imagePath;
  final GameStatus status;
  final Set<GameTag>? tags;
  final GameGenre genre;

  const Game({
    required this.name,
    this.imagePath,
    required this.status,
    this.tags,
    required this.genre,
  });
}
