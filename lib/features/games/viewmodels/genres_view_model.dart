import 'package:nexplay/features/games/models/class/genres.dart';
import 'package:nexplay/features/games/models/repositories/genres_database.dart';

class GenresViewModel {
  final GenresDatabase _genresDatabase;
  late final Future<List<Genre>> genres = _genresDatabase.getGenres();

  GenresViewModel({required this._genresDatabase});
}
