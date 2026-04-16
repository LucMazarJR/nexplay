class GameSummary {
  const GameSummary({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.released,
    required this.rating,
    required this.metacritic,
    required this.genres,
  });

  factory GameSummary.fromJson(Map<String, dynamic> json) {
    return GameSummary(
      id: json['id'] as int? ?? 0,
      name: (json['name'] as String?)?.trim().isNotEmpty == true
          ? (json['name'] as String).trim()
          : 'Sem nome',
      imageUrl: json['background_image'] as String?,
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
    );
  }

  final int id;
  final String name;
  final String? imageUrl;
  final String? released;
  final double rating;
  final int? metacritic;
  final List<String> genres;

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
