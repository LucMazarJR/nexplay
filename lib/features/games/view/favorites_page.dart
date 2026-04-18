import 'package:flutter/material.dart';
import 'package:nexplay/features/games/model/favorite_game.dart';
import 'package:nexplay/features/games/model/game_summary.dart';
import 'package:nexplay/features/games/service/favorites_service.dart';
import 'package:nexplay/features/games/service/rawg_service.dart';
import 'package:nexplay/features/games/view/game_detail_page.dart';
import 'package:nexplay/features/games/viewmodel/favorites_view_model.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  final _viewModel = FavoritesViewModel();
  final _favoritesService = FavoritesService();

  @override
  void initState() {
    super.initState();
    _viewModel.startListening();
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  void _showAddDialog() {
    showDialog(
      context: context,
      builder: (context) => _AddFavoriteDialog(
        onAdd: (game) async {
          await _favoritesService.addFavorite(game);
        },
      ),
    );
  }

  void _showRandomGame() {
    if (_viewModel.favorites.isEmpty) return;
    
    final random = _viewModel.favorites[
      DateTime.now().millisecondsSinceEpoch % _viewModel.favorites.length
    ];
    
    showDialog(
      context: context,
      builder: (context) => _RandomGameDialog(
        game: random,
        allGames: _viewModel.favorites,
      ),
    );
  }

  void _showDeleteConfirm(FavoriteGame game) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Remover favorito'),
        content: Text('Deseja remover "${game.name}" dos favoritos?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancelar'),
          ),
          FilledButton(
            onPressed: () async {
              Navigator.of(context).pop();
              await _favoritesService.removeFavorite(game.id);
            },
            child: const Text('Remover'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    
    return AnimatedBuilder(
      animation: _viewModel,
      builder: (context, _) {
        return Scaffold(
          backgroundColor: colors.surfaceContainerHighest,
          appBar: AppBar(
            title: const Text('Favoritos'),
            actions: [
              if (_viewModel.favorites.isNotEmpty)
                IconButton(
                  icon: const Icon(Icons.shuffle),
                  tooltip: 'Sortear jogo',
                  onPressed: _showRandomGame,
                ),
            ],
          ),
          body: _viewModel.favorites.isEmpty
              ? const Center(
                  child: Text('Nenhum favorito adicionado ainda.'),
                )
              : ListView.separated(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  itemCount: _viewModel.favorites.length,
                  separatorBuilder: (context, index) => Divider(
                    height: 1,
                    thickness: 1,
                    color: colors.outlineVariant.withValues(alpha: 0.3),
                  ),
                  itemBuilder: (context, index) {
                    final game = _viewModel.favorites[index];
                    return Container(
                      color: colors.surface,
                      child: ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 6,
                        ),
                        title: Text(
                          game.name,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        trailing: PopupMenuButton<String>(
                          icon: const Icon(Icons.more_vert, size: 20),
                          onSelected: (value) {
                            if (value == 'delete') {
                              _showDeleteConfirm(game);
                            }
                          },
                          itemBuilder: (context) => [
                            const PopupMenuItem(
                              value: 'delete',
                              child: Row(
                                children: [
                                  Icon(Icons.delete, size: 18),
                                  SizedBox(width: 8),
                                  Text('Excluir'),
                                ],
                              ),
                            ),
                          ],
                        ),
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute<void>(
                              builder: (_) => GameDetailPage(
                                gameId: game.id,
                                gameName: game.name,
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
          floatingActionButton: FloatingActionButton(
            onPressed: _showAddDialog,
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}

class _AddFavoriteDialog extends StatefulWidget {
  const _AddFavoriteDialog({required this.onAdd});

  final Future<void> Function(FavoriteGame) onAdd;

  @override
  State<_AddFavoriteDialog> createState() => _AddFavoriteDialogState();
}

class _AddFavoriteDialogState extends State<_AddFavoriteDialog> {
  final _searchController = TextEditingController();
  final _nameController = TextEditingController();
  final _rawgService = RawgService();
  
  bool _isSearching = false;
  List<GameSummary> _searchResults = [];

  @override
  void dispose() {
    _searchController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  Future<void> _searchRawg() async {
    final query = _searchController.text.trim();
    if (query.isEmpty) return;

    setState(() {
      _isSearching = true;
      _searchResults = [];
    });

    try {
      final response = await _rawgService.fetchGames(
        page: 1,
        search: query,
        ordering: '-rating',
        parentPlatformIds: [],
      );
      setState(() {
        _searchResults = response.games;
        _isSearching = false;
      });
    } catch (e) {
      setState(() {
        _isSearching = false;
      });
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erro ao buscar: $e')),
        );
      }
    }
  }

  Future<void> _addFromRawg(GameSummary game) async {
    final favorite = FavoriteGame(
      id: game.id,
      name: game.name,
      imageUrl: game.imageUrl,
      released: game.released,
      rating: game.rating,
      isCustom: false,
    );
    await widget.onAdd(favorite);
    if (mounted) Navigator.of(context).pop();
  }

  Future<void> _addManual() async {
    final name = _nameController.text.trim();
    if (name.isEmpty) return;

    final favorite = FavoriteGame(
      id: DateTime.now().millisecondsSinceEpoch,
      name: name,
      isCustom: true,
    );
    await widget.onAdd(favorite);
    if (mounted) Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        constraints: const BoxConstraints(maxHeight: 500),
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Adicionar Favorito',
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Buscar jogo',
                hintText: 'Digite o nome do jogo',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: _searchRawg,
                ),
              ),
              onSubmitted: (_) => _searchRawg(),
            ),
            const SizedBox(height: 12),
            const Divider(),
            const SizedBox(height: 8),
            Text(
              'Ou adicione manualmente',
              style: Theme.of(context).textTheme.bodySmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Nome personalizado',
                hintText: 'Digite o nome',
              ),
            ),
            const SizedBox(height: 12),
            FilledButton.icon(
              onPressed: _addManual,
              icon: const Icon(Icons.add),
              label: const Text('Adicionar personalizado'),
            ),
            if (_isSearching) ...[
              const SizedBox(height: 16),
              const Center(child: CircularProgressIndicator()),
            ],
            if (_searchResults.isNotEmpty) ...[
              const SizedBox(height: 16),
              Text(
                'Resultados da busca:',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              const SizedBox(height: 8),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: _searchResults.length,
                  itemBuilder: (context, index) {
                    final game = _searchResults[index];
                    return ListTile(
                      dense: true,
                      leading: const Icon(Icons.sports_esports, size: 20),
                      title: Text(
                        game.name,
                        style: const TextStyle(fontSize: 14),
                      ),
                      subtitle: Text(
                        game.released ?? '',
                        style: const TextStyle(fontSize: 12),
                      ),
                      onTap: () => _addFromRawg(game),
                    );
                  },
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}


class _RandomGameDialog extends StatefulWidget {
  const _RandomGameDialog({
    required this.game,
    required this.allGames,
  });

  final FavoriteGame game;
  final List<FavoriteGame> allGames;

  @override
  State<_RandomGameDialog> createState() => _RandomGameDialogState();
}

class _RandomGameDialogState extends State<_RandomGameDialog> {
  late FavoriteGame _currentGame;

  @override
  void initState() {
    super.initState();
    _currentGame = widget.game;
  }

  void _reroll() {
    if (widget.allGames.isEmpty) return;
    setState(() {
      _currentGame = widget.allGames[
        DateTime.now().millisecondsSinceEpoch % widget.allGames.length
      ];
    });
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Jogo Sorteado',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 20),
            if (_currentGame.imageUrl != null)
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  _currentGame.imageUrl!,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    height: 200,
                    decoration: BoxDecoration(
                      color: colors.primary.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Center(
                      child: Icon(Icons.sports_esports, size: 64),
                    ),
                  ),
                ),
              )
            else
              Container(
                height: 200,
                decoration: BoxDecoration(
                  color: colors.primary.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Center(
                  child: Icon(Icons.sports_esports, size: 64),
                ),
              ),
            const SizedBox(height: 16),
            Text(
              _currentGame.name,
              style: Theme.of(context).textTheme.titleMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OutlinedButton.icon(
                  onPressed: _reroll,
                  icon: const Icon(Icons.refresh),
                  label: const Text('Sortear novamente'),
                ),
              ],
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(
                    MaterialPageRoute<void>(
                      builder: (_) => GameDetailPage(
                        gameId: _currentGame.id,
                        gameName: _currentGame.name,
                      ),
                    ),
                  );
                },
                child: const Text('Ver detalhes'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
