class FavoriteGame {
  const FavoriteGame({
    required this.id,
    required this.name,
    this.imageUrl,
    this.released,
    this.rating,
    required this.isCustom,
  });

  factory FavoriteGame.fromFirestore(Map<String, dynamic> data) {
    return FavoriteGame(
      id: data['id'] as int? ?? 0,
      name: data['name'] as String? ?? '',
      imageUrl: data['imageUrl'] as String?,
      released: data['released'] as String?,
      rating: (data['rating'] as num?)?.toDouble(),
      isCustom: data['isCustom'] as bool? ?? false,
    );
  }

  final int id;
  final String name;
  final String? imageUrl;
  final String? released;
  final double? rating;
  final bool isCustom;

  Map<String, dynamic> toFirestore() {
    return {
      'id': id,
      'name': name,
      'imageUrl': imageUrl,
      'released': released,
      'rating': rating,
      'isCustom': isCustom,
    };
  }
}
