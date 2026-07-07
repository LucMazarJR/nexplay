import 'package:nexplay/features/games/models/class/genres.dart';
import 'package:nexplay/features/games/models/class/tags.dart';
import 'package:nexplay/features/games/models/enum/add_game_form.dart';

class Game {
  final int? id;
  final String name;
  final GameStatus status;
  final Genre genre;
  final Set<Tag>? tags;
  final String? imagePath;

  const Game({
    this.id,
    required this.name,
    required this.status,
    required this.genre,
    this.tags,
    this.imagePath,
  });
}
