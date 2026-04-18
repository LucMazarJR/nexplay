import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:nexplay/features/games/model/favorite_game.dart';

class FavoritesService {
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  String? get _userId => _auth.currentUser?.uid;

  CollectionReference<Map<String, dynamic>>? get _favoritesCollection {
    final uid = _userId;
    if (uid == null) return null;
    return _firestore.collection('users').doc(uid).collection('favorites');
  }

  Future<void> addFavorite(FavoriteGame game) async {
    final collection = _favoritesCollection;
    if (collection == null) throw Exception('Usuario nao autenticado');
    await collection.doc('${game.id}').set(game.toFirestore());
  }

  Future<void> removeFavorite(int gameId) async {
    final collection = _favoritesCollection;
    if (collection == null) throw Exception('Usuario nao autenticado');
    await collection.doc('$gameId').delete();
  }

  Future<bool> isFavorite(int gameId) async {
    final collection = _favoritesCollection;
    if (collection == null) return false;
    final doc = await collection.doc('$gameId').get();
    return doc.exists;
  }

  Stream<List<FavoriteGame>> getFavoritesStream() {
    final collection = _favoritesCollection;
    if (collection == null) return Stream.value([]);
    
    return collection.snapshots().map((snapshot) {
      return snapshot.docs
          .map((doc) => FavoriteGame.fromFirestore(doc.data()))
          .toList();
    });
  }
}
