import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:nexplay/features/games/model/game_detail.dart';
import 'package:nexplay/features/games/model/game_summary.dart';

class RawgService {
  RawgService({http.Client? client}) : _client = client ?? http.Client();

  final http.Client _client;
  static const String _baseUrl = 'https://api.rawg.io/api';

  Future<PagedGamesResponse> fetchGames({
    required int page,
    required String search,
    required String ordering,
    required List<int> parentPlatformIds,
  }) async {
    final query = <String, String>{
      'key': _apiKey,
      'page': '$page',
      'page_size': '20',
      'ordering': ordering,
    };

    final normalizedSearch = search.trim();
    if (normalizedSearch.isNotEmpty) {
      query['search'] = normalizedSearch;
    }

    if (parentPlatformIds.isNotEmpty) {
      query['parent_platforms'] = parentPlatformIds.join(',');
    }

    final uri = Uri.parse('$_baseUrl/games').replace(queryParameters: query);
    final response = await _client.get(uri);

    if (response.statusCode != 200) {
      throw RawgException(
        'Falha ao carregar jogos (${response.statusCode}). Tente novamente.',
      );
    }

    final data = jsonDecode(response.body) as Map<String, dynamic>;
    final results = data['results'] as List<dynamic>? ?? const <dynamic>[];

    final games = results
        .whereType<Map<String, dynamic>>()
        .map(GameSummary.fromJson)
        .toList(growable: false);

    final hasNextPage = data['next'] != null;

    return PagedGamesResponse(games: games, hasNextPage: hasNextPage);
  }

  Future<GameDetail> fetchGameDetail(int gameId) async {
    final uri = Uri.parse(
      '$_baseUrl/games/$gameId',
    ).replace(queryParameters: {'key': _apiKey});

    final response = await _client.get(uri);

    if (response.statusCode != 200) {
      throw RawgException(
        'Falha ao carregar detalhes do jogo (${response.statusCode}).',
      );
    }

    final data = jsonDecode(response.body) as Map<String, dynamic>;
    return GameDetail.fromJson(data);
  }

  String get _apiKey {
    final key = dotenv.env['RAWG_API_KEY']?.trim();
    if (key == null || key.isEmpty) {
      throw const RawgException(
        'RAWG_API_KEY nao encontrada. Preencha o arquivo .env.',
      );
    }
    return key;
  }
}

class PagedGamesResponse {
  const PagedGamesResponse({required this.games, required this.hasNextPage});

  final List<GameSummary> games;
  final bool hasNextPage;
}

class RawgException implements Exception {
  const RawgException(this.message);

  final String message;
}
