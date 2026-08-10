import 'package:collection/collection.dart';
import 'package:nexplay/features/games/models/class/tags.dart';
import 'package:nexplay/features/games/models/repositories/tags_database.dart';

class TagsViewModel {
  final TagsDatabase _tagsDatabase;

  late final Future<Map<String, List<Tag>>> tags = _groupTags();

  Future<Map<String, List<Tag>>> _groupTags() async {
    return groupBy(await _tagsDatabase.getTags(), (tag) => tag.type);
  }

  TagsViewModel({required this._tagsDatabase});
}
