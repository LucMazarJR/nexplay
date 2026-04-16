import 'package:flutter/foundation.dart';
import 'package:nexplay/features/games/model/game_summary.dart';
import 'package:nexplay/features/games/service/rawg_service.dart';

class GamesListViewModel extends ChangeNotifier {
  GamesListViewModel({RawgService? rawgService})
    : _rawgService = rawgService ?? RawgService();

  static const List<GamesOrderingOption> orderingOptions = [
    GamesOrderingOption(value: '-added', label: 'Mais populares'),
    GamesOrderingOption(value: '-rating', label: 'Melhor avaliados'),
    GamesOrderingOption(value: '-released', label: 'Lancamentos recentes'),
    GamesOrderingOption(value: '-metacritic', label: 'Melhor metacritic'),
  ];

  final RawgService _rawgService;

  final List<GameSummary> _games = <GameSummary>[];
  final Set<int> _selectedPlatformIds = <int>{};

  bool _isLoading = false;
  bool _isLoadingMore = false;
  String _search = '';
  String _ordering = orderingOptions.first.value;
  int _currentPage = 1;
  bool _hasNextPage = true;
  String? _errorMessage;

  List<GameSummary> get games => List.unmodifiable(_games);
  bool get isLoading => _isLoading;
  bool get isLoadingMore => _isLoadingMore;
  String get search => _search;
  String get ordering => _ordering;
  bool get hasNextPage => _hasNextPage;
  String? get errorMessage => _errorMessage;

  List<int> get selectedPlatformIds {
    final ids = _selectedPlatformIds.toList(growable: false);
    ids.sort();
    return ids;
  }

  bool isPlatformSelected(int platformId) {
    return _selectedPlatformIds.contains(platformId);
  }

  void setSearch(String value) {
    _search = value.trim();
  }

  void togglePlatform(int platformId) {
    if (_selectedPlatformIds.contains(platformId)) {
      _selectedPlatformIds.remove(platformId);
    } else {
      _selectedPlatformIds.add(platformId);
    }
    notifyListeners();
  }

  void setOrdering(String value) {
    if (value == _ordering) return;
    _ordering = value;
    notifyListeners();
  }

  Future<void> loadInitial() async {
    _isLoading = true;
    _errorMessage = null;
    _currentPage = 1;
    _hasNextPage = true;
    notifyListeners();

    try {
      final result = await _rawgService.fetchGames(
        page: _currentPage,
        search: _search,
        ordering: _ordering,
        parentPlatformIds: selectedPlatformIds,
      );

      _games
        ..clear()
        ..addAll(result.games);
      _hasNextPage = result.hasNextPage;
    } on RawgException catch (error) {
      _games.clear();
      _errorMessage = error.message;
    } catch (_) {
      _games.clear();
      _errorMessage = 'Erro inesperado ao carregar jogos.';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> refresh() async {
    await loadInitial();
  }

  Future<void> loadMore() async {
    if (_isLoading || _isLoadingMore || !_hasNextPage) return;

    _isLoadingMore = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final nextPage = _currentPage + 1;

      final result = await _rawgService.fetchGames(
        page: nextPage,
        search: _search,
        ordering: _ordering,
        parentPlatformIds: selectedPlatformIds,
      );

      _games.addAll(result.games);
      _currentPage = nextPage;
      _hasNextPage = result.hasNextPage;
    } on RawgException catch (error) {
      _errorMessage = error.message;
    } catch (_) {
      _errorMessage = 'Erro inesperado ao carregar mais jogos.';
    } finally {
      _isLoadingMore = false;
      notifyListeners();
    }
  }
}

class GamesOrderingOption {
  const GamesOrderingOption({required this.value, required this.label});

  final String value;
  final String label;
}
