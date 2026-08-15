import 'package:flutter/material.dart';
import 'package:nexplay/features/games/models/repositories/games_database.dart';
import 'package:nexplay/features/games/viewmodels/games_list_view_model.dart';
import 'package:nexplay/features/games/views/pages/add_game.dart';

class GameList extends StatefulWidget {
  const GameList({super.key});

  @override
  State<GameList> createState() => _GameListState();
}

class _GameListState extends State<GameList> {
  final GamesListViewModel _gamesListViewModel = GamesListViewModel(
    gamesDatabase: GamesDatabase(),
  );

  @override
  Widget build(BuildContext context) {
    final themeColors = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(title: Text('Meus jogos')),
      body: FutureBuilder(
        future: _gamesListViewModel.gamesItems,
        builder: (context, asyncSnapshot) {
          ConnectionState connectionState = asyncSnapshot.connectionState;

          if (connectionState == .waiting) {
            return CircularProgressIndicator();
          } else if (connectionState == .done && !asyncSnapshot.hasError) {
            if (asyncSnapshot.data!.isEmpty) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 25,
                ),
                child: Center(
                  child: Column(
                    spacing: 10,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: themeColors.secondaryContainer,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(25),
                          child: Icon(
                            Icons.sports_esports_outlined,
                            color: themeColors.primary,
                            size: 85,
                          ),
                        ),
                      ),
                      Text(
                        'Sua biblioteca está vazia',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        'Adicione o primeiro jogo da sua coleção para começar.',
                        style: TextStyle(fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return ListView.builder(
                itemCount: asyncSnapshot.data!.length,
                itemBuilder: (context, index) {
                  var game = asyncSnapshot.data![index];
                  return Container(
                    decoration: BoxDecoration(
                      color: index % 2 == 0
                          ? themeColors.surfaceContainer
                          : themeColors.surface,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(6),
                      child: Row(
                        children: [
                          Text(game.name),
                        ],
                      ),
                    ),
                  );
                },
              );
            }
          }
          return Center(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  mainAxisAlignment: .center,
                  spacing: 10,
                  children: [
                    Icon(Icons.error, size: 100, color: themeColors.error),
                    Text(
                      "Ocorreu um erro ao carregar os jogos...",
                      textAlign: .center,
                      style: TextStyle(
                        color: themeColors.error,
                        fontSize: 16,
                        fontWeight: .bold,
                        letterSpacing: 0,
                      ),
                    ),
                    Text(
                      asyncSnapshot.error.toString(),
                      textAlign: .center,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: .w500,
                        letterSpacing: 0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(
            context,
          ).push(MaterialPageRoute(builder: (context) => AddGame()));
        },
      ),
    );
  }
}
