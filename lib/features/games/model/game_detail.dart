class GameDetail {
  const GameDetail({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.secondaryImageUrl,
    required this.released,
    required this.rating,
    required this.metacritic,
    required this.genres,
    required this.publishers,
    required this.website,
  });

  factory GameDetail.fromJson(Map<String, dynamic> json) {
    return GameDetail(
      id: json['id'] as int? ?? 0,
      name: (json['name'] as String?)?.trim().isNotEmpty == true
          ? (json['name'] as String).trim()
          : 'Sem nome',
      description: (json['description_raw'] as String?)?.trim() ?? '',
      imageUrl: json['background_image'] as String?,
      secondaryImageUrl: json['background_image_additional'] as String?,
      released: json['released'] as String?,
      rating: _toDouble(json['rating']) ?? 0,
      metacritic: _toInt(json['metacritic']),
      genres:
          ((json['genres'] as List<dynamic>? ?? const <dynamic>[])
                  .whereType<Map<String, dynamic>>()
                  .map((genre) => genre['name'] as String?)
                  .whereType<String>()
                  .map((genre) => genre.trim())
                  .where((genre) => genre.isNotEmpty))
              .toList(growable: false),
      publishers:
          ((json['publishers'] as List<dynamic>? ?? const <dynamic>[])
                  .whereType<Map<String, dynamic>>()
                  .map((publisher) => publisher['name'] as String?)
                  .whereType<String>()
                  .map((publisher) => publisher.trim())
                  .where((publisher) => publisher.isNotEmpty))
              .toList(growable: false),
      website: (json['website'] as String?)?.trim(),
    );
  }

  final int id;
  final String name;
  final String description;
  final String? imageUrl;
  final String? secondaryImageUrl;
  final String? released;
  final double rating;
  final int? metacritic;
  final List<String> genres;
  final List<String> publishers;
  final String? website;

  static double? _toDouble(dynamic value) {
    if (value is num) return value.toDouble();
    return double.tryParse('$value');
  }

  static int? _toInt(dynamic value) {
    if (value is int) return value;
    if (value is num) return value.toInt();
    return int.tryParse('$value');
  }
}
