import 'package:flutter/foundation.dart';
import 'package:nexplay/features/games/model/game_detail.dart';
import 'package:nexplay/features/games/service/rawg_service.dart';

class GameDetailViewModel extends ChangeNotifier {
  GameDetailViewModel({RawgService? rawgService})
    : _rawgService = rawgService ?? RawgService();

  final RawgService _rawgService;

  GameDetail? _gameDetail;
  bool _isLoading = false;
  String? _errorMessage;

  GameDetail? get gameDetail => _gameDetail;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> load(int gameId) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _gameDetail = await _rawgService.fetchGameDetail(gameId);
    } on RawgException catch (error) {
      _errorMessage = error.message;
    } catch (_) {
      _errorMessage = 'Erro inesperado ao carregar detalhes.';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
