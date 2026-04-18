import 'package:flutter/material.dart';
import 'package:nexplay/features/auth/service/auth_service.dart';
import 'package:nexplay/features/games/model/game_platform_filter.dart';
import 'package:nexplay/features/games/model/game_summary.dart';
import 'package:nexplay/features/games/view/favorites_page.dart';
import 'package:nexplay/features/games/view/game_detail_page.dart';
import 'package:nexplay/features/games/viewmodel/games_list_view_model.dart';

class GamesPage extends StatefulWidget {
  const GamesPage({super.key});

  @override
  State<GamesPage> createState() => _GamesPageState();
}

class _GamesPageState extends State<GamesPage> {
  final GamesListViewModel _viewModel = GamesListViewModel();
  final TextEditingController _searchController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final AuthService _authService = AuthService();

  @override
  void initState() {
    super.initState();
    _viewModel.loadInitial();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _searchController.dispose();
    _scrollController.dispose();
    _viewModel.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (!_scrollController.hasClients) return;

    final position = _scrollController.position;
    if (position.pixels >= position.maxScrollExtent - 280) {
      _viewModel.loadMore();
    }
  }

  Future<void> _applySearch() async {
    _viewModel.setSearch(_searchController.text);
    await _viewModel.loadInitial();
  }

  Future<void> _changeOrdering(String? value) async {
    if (value == null) return;
    _viewModel.setOrdering(value);
    await _viewModel.loadInitial();
  }

  Future<void> _togglePlatform(GamePlatformFilter platform) async {
    _viewModel.togglePlatform(platform.id);
    await _viewModel.loadInitial();
  }

  Future<void> _signOut() async {
    await _authService.signOut();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Explorar jogos'),
        actions: [
          IconButton(
            tooltip: 'Sair',
            onPressed: _signOut,
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: colors.primary,
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(Icons.sports_esports, size: 48),
                  SizedBox(height: 8),
                  Text(
                    'Nexplay',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.explore),
              title: const Text('Explorar'),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              leading: const Icon(Icons.star),
              title: const Text('Favoritos'),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(
                  MaterialPageRoute<void>(
                    builder: (_) => const FavoritesPage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: AnimatedBuilder(
        animation: _viewModel,
        builder: (context, _) {
          if (_viewModel.isLoading && _viewModel.games.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }

          if (_viewModel.errorMessage != null && _viewModel.games.isEmpty) {
            return _LoadErrorState(
              message: _viewModel.errorMessage!,
              onRetry: _viewModel.loadInitial,
            );
          }

          return Column(
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(12, 10, 12, 8),
                decoration: BoxDecoration(
                  color: colors.surface.withValues(alpha: 0.82),
                  border: Border(
                    bottom: BorderSide(
                      color: colors.onSurface.withValues(alpha: 0.08),
                    ),
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _searchController,
                            textInputAction: TextInputAction.search,
                            onSubmitted: (_) => _applySearch(),
                            decoration: InputDecoration(
                              hintText: 'Buscar por nome (ex: Zelda, FIFA)',
                              prefixIcon: const Icon(Icons.search),
                              suffixIcon: IconButton(
                                tooltip: 'Pesquisar',
                                onPressed: _applySearch,
                                icon: const Icon(Icons.arrow_forward),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: GamePlatformFilter.options
                          .map((platform) {
                            final selected = _viewModel.isPlatformSelected(
                              platform.id,
                            );

                            return FilterChip(
                              avatar: Icon(platform.icon, size: 18),
                              label: Text(platform.label),
                              selected: selected,
                              onSelected: (_) => _togglePlatform(platform),
                            );
                          })
                          .toList(growable: false),
                    ),
                    const SizedBox(height: 10),
                    DropdownButtonFormField<String>(
                      key: ValueKey<String>(_viewModel.ordering),
                      initialValue: _viewModel.ordering,
                      decoration: const InputDecoration(
                        labelText: 'Ordenar por',
                        prefixIcon: Icon(Icons.tune),
                      ),
                      items: GamesListViewModel.orderingOptions
                          .map(
                            (option) => DropdownMenuItem<String>(
                              value: option.value,
                              child: Text(option.label),
                            ),
                          )
                          .toList(growable: false),
                      onChanged: _changeOrdering,
                    ),
                  ],
                ),
              ),
              if (_viewModel.errorMessage != null)
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  color: colors.errorContainer.withValues(alpha: 0.6),
                  child: Text(
                    _viewModel.errorMessage!,
                    style: TextStyle(color: colors.onErrorContainer),
                  ),
                ),
              Expanded(
                child: RefreshIndicator(
                  onRefresh: _viewModel.refresh,
                  child: _viewModel.games.isEmpty
                      ? ListView(
                          children: const [
                            SizedBox(height: 120),
                            Center(
                              child: Text(
                                'Nenhum jogo encontrado para esse filtro.',
                              ),
                            ),
                          ],
                        )
                      : LayoutBuilder(
                          builder: (context, constraints) {
                            final width = constraints.maxWidth;
                            final crossAxisCount = width >= 1100
                                ? 4
                                : width >= 780
                                ? 3
                                : 2;

                            return GridView.builder(
                              controller: _scrollController,
                              padding: const EdgeInsets.all(12),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: crossAxisCount,
                                    mainAxisSpacing: 12,
                                    crossAxisSpacing: 12,
                                    childAspectRatio: 0.74,
                                  ),
                              itemCount:
                                  _viewModel.games.length +
                                  (_viewModel.isLoadingMore ? 1 : 0),
                              itemBuilder: (context, index) {
                                if (index >= _viewModel.games.length) {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }

                                final game = _viewModel.games[index];
                                return _GameCard(
                                  game: game,
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
                                );
                              },
                            );
                          },
                        ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _GameCard extends StatelessWidget {
  const _GameCard({required this.game, required this.onTap});

  final GameSummary game;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Card(
      margin: EdgeInsets.zero,
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Stack(
                fit: StackFit.expand,
                children: [
                  if (game.imageUrl != null && game.imageUrl!.isNotEmpty)
                    Image.network(
                      game.imageUrl!,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) =>
                          _ImageFallback(game: game),
                    )
                  else
                    _ImageFallback(game: game),
                  DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withValues(alpha: 0.7),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 8,
                    right: 8,
                    bottom: 8,
                    child: Text(
                      game.name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 4),
              child: Row(
                children: [
                  const Icon(Icons.star_rate_rounded, size: 18),
                  const SizedBox(width: 4),
                  Text(game.rating.toStringAsFixed(1)),
                  const SizedBox(width: 12),
                  const Icon(Icons.calendar_month_outlined, size: 16),
                  const SizedBox(width: 4),
                  Expanded(
                    child: Text(
                      _formatDate(game.released),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
            if (game.genres.isNotEmpty)
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                child: Text(
                  game.genres.take(2).join(' • '),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: colors.onSurface.withValues(alpha: 0.72),
                    fontSize: 12,
                  ),
                ),
              )
            else
              const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  String _formatDate(String? rawDate) {
    if (rawDate == null || rawDate.trim().isEmpty) {
      return 'Sem data';
    }

    final parts = rawDate.split('-');
    if (parts.length != 3) return rawDate;
    return '${parts[2]}/${parts[1]}/${parts[0]}';
  }
}

class _ImageFallback extends StatelessWidget {
  const _ImageFallback({required this.game});

  final GameSummary game;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return ColoredBox(
      color: colors.primary.withValues(alpha: 0.2),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Text(
            game.name,
            textAlign: TextAlign.center,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: colors.onSurface,
            ),
          ),
        ),
      ),
    );
  }
}

class _LoadErrorState extends StatelessWidget {
  const _LoadErrorState({required this.message, required this.onRetry});

  final String message;
  final Future<void> Function() onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(message, textAlign: TextAlign.center),
            const SizedBox(height: 12),
            FilledButton.icon(
              onPressed: onRetry,
              icon: const Icon(Icons.refresh),
              label: const Text('Tentar novamente'),
            ),
          ],
        ),
      ),
    );
  }
}
