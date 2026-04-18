import 'dart:async';
import 'package:flutter/material.dart';
import 'package:nexplay/features/games/model/favorite_game.dart';
import 'package:nexplay/features/games/service/favorites_service.dart';

class FavoritesViewModel extends ChangeNotifier {
  final _service = FavoritesService();
  StreamSubscription<List<FavoriteGame>>? _subscription;
  
  List<FavoriteGame> _favorites = [];
  List<FavoriteGame> get favorites => _favorites;

  void startListening() {
    _subscription = _service.getFavoritesStream().listen((favorites) {
      _favorites = favorites;
      notifyListeners();
    });
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }
}
