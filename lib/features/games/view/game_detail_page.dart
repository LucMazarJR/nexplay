import 'package:flutter/material.dart';
import 'package:nexplay/features/games/model/favorite_game.dart';
import 'package:nexplay/features/games/model/game_detail.dart';
import 'package:nexplay/features/games/service/favorites_service.dart';
import 'package:nexplay/features/games/viewmodel/game_detail_view_model.dart';

class GameDetailPage extends StatefulWidget {
  const GameDetailPage({
    super.key,
    required this.gameId,
    required this.gameName,
  });

  final int gameId;
  final String gameName;

  @override
  State<GameDetailPage> createState() => _GameDetailPageState();
}

class _GameDetailPageState extends State<GameDetailPage> {
  late final GameDetailViewModel _viewModel;
  final _favoritesService = FavoritesService();
  bool _isFavorite = false;

  @override
  void initState() {
    super.initState();
    _viewModel = GameDetailViewModel();
    _viewModel.load(widget.gameId);
    _checkFavorite();
  }

  Future<void> _checkFavorite() async {
    final isFav = await _favoritesService.isFavorite(widget.gameId);
    setState(() {
      _isFavorite = isFav;
    });
  }

  Future<void> _toggleFavorite() async {
    final detail = _viewModel.gameDetail;
    if (detail == null) return;

    if (_isFavorite) {
      await _favoritesService.removeFavorite(widget.gameId);
    } else {
      final favorite = FavoriteGame(
        id: detail.id,
        name: detail.name,
        imageUrl: detail.imageUrl,
        released: detail.released,
        rating: detail.rating,
        isCustom: false,
      );
      await _favoritesService.addFavorite(favorite);
    }
    await _checkFavorite();
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: _viewModel,
        builder: (context, _) {
          final detail = _viewModel.gameDetail;

          if (_viewModel.isLoading && detail == null) {
            return const Center(child: CircularProgressIndicator());
          }

          if (_viewModel.errorMessage != null && detail == null) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(_viewModel.errorMessage!, textAlign: TextAlign.center),
                    const SizedBox(height: 12),
                    FilledButton.icon(
                      onPressed: () => _viewModel.load(widget.gameId),
                      icon: const Icon(Icons.refresh),
                      label: const Text('Tentar novamente'),
                    ),
                  ],
                ),
              ),
            );
          }

          if (detail == null) {
            return const Center(child: Text('Detalhes indisponiveis.'));
          }

          return _DetailContent(
            detail: detail,
            isFavorite: _isFavorite,
            onToggleFavorite: _toggleFavorite,
          );
        },
      ),
    );
  }
}

class _DetailContent extends StatelessWidget {
  const _DetailContent({
    required this.detail,
    required this.isFavorite,
    required this.onToggleFavorite,
  });

  final GameDetail detail;
  final bool isFavorite;
  final VoidCallback onToggleFavorite;

  @override
  Widget build(BuildContext context) {
    final image = detail.imageUrl ?? detail.secondaryImageUrl;

    return CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: true,
          expandedHeight: 300,
          title: Text(
            detail.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          actions: [
            IconButton(
              icon: Icon(
                isFavorite ? Icons.star : Icons.star_border,
              ),
              onPressed: onToggleFavorite,
            ),
          ],
          flexibleSpace: FlexibleSpaceBar(
            background: Stack(
              fit: StackFit.expand,
              children: [
                if (image != null && image.isNotEmpty)
                  Image.network(
                    image,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                        const _DetailImageFallback(),
                  )
                else
                  const _DetailImageFallback(),
                DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withValues(alpha: 0.1),
                        Colors.black.withValues(alpha: 0.8),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 28),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: [
                    _InfoChip(
                      icon: Icons.calendar_month_outlined,
                      label: _formatDate(detail.released),
                    ),
                    _InfoChip(
                      icon: Icons.star_rate_rounded,
                      label: detail.rating.toStringAsFixed(1),
                    ),
                    _InfoChip(
                      icon: Icons.emoji_events_outlined,
                      label: detail.metacritic?.toString() ?? 'Sem metacritic',
                    ),
                  ],
                ),
                if (detail.genres.isNotEmpty) ...[
                  const SizedBox(height: 18),
                  Text(
                    'Generos',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: detail.genres
                        .map((genre) => Chip(label: Text(genre)))
                        .toList(growable: false),
                  ),
                ],
                if (detail.publishers.isNotEmpty) ...[
                  const SizedBox(height: 18),
                  Text(
                    'Publicadoras',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 4),
                  Text(detail.publishers.join(', ')),
                ],
                const SizedBox(height: 18),
                Text(
                  'Descricao',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 8),
                Text(
                  detail.description.isEmpty
                      ? 'A RAWG nao retornou descricao para este titulo.'
                      : detail.description,
                ),
              ],
            ),
          ),
        ),
      ],
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

class _DetailImageFallback extends StatelessWidget {
  const _DetailImageFallback();

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.22),
      child: const Center(child: Icon(Icons.sports_esports, size: 88)),
    );
  }
}

class _InfoChip extends StatelessWidget {
  const _InfoChip({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: colors.surface.withValues(alpha: 0.75),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: colors.onSurface.withValues(alpha: 0.12)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 18),
            const SizedBox(width: 6),
            Text(label),
          ],
        ),
      ),
    );
  }
}
