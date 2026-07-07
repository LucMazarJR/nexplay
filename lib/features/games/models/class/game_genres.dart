// Campo único de seleção no cadastro do jogo. Depois vira tabela GameGenres no SQLite.

class GameGenre {
  final int id;
  final String name;

  const GameGenre({
    required this.id,
    required this.name,
  });
}

final List<GameGenre> genresSeed = [
  GameGenre(id: 1, name: 'RPG'),
  GameGenre(id: 2, name: 'RPG de Ação'),
  GameGenre(id: 3, name: 'RPG Tático'),
  GameGenre(id: 4, name: 'JRPG'),
  GameGenre(id: 5, name: 'Plataforma'),
  GameGenre(id: 6, name: 'Hack and Slash'),
  GameGenre(id: 7, name: 'Survival Horror'),
  GameGenre(id: 8, name: 'Battle Royale'),
  GameGenre(id: 9, name: 'MOBA'),
  GameGenre(id: 10, name: 'FPS'),
  GameGenre(id: 11, name: 'TPS'),
  GameGenre(id: 12, name: 'Simulador'),
  GameGenre(id: 13, name: 'Simulador de Vida'),
  GameGenre(id: 14, name: 'Farming Sim'),
  GameGenre(id: 15, name: 'Tycoon'),
  GameGenre(id: 16, name: 'City Builder'),
  GameGenre(id: 17, name: 'Tower Defense'),
  GameGenre(id: 18, name: 'Dungeon Crawler'),
  GameGenre(id: 19, name: 'Puzzle'),
  GameGenre(id: 20, name: 'Visual Novel'),
  GameGenre(id: 21, name: 'Point and Click'),
  GameGenre(id: 22, name: 'Luta'),
  GameGenre(id: 23, name: 'Corrida'),
  GameGenre(id: 24, name: 'Esporte'),
  GameGenre(id: 25, name: 'Estratégia'),
  GameGenre(id: 26, name: 'RTS'),
  GameGenre(id: 27, name: 'Estratégia por Turnos'),
  GameGenre(id: 28, name: '4X'),
  GameGenre(id: 29, name: 'Card Game'),
  GameGenre(id: 30, name: 'Auto Battler'),
  GameGenre(id: 31, name: 'Party Game'),
  GameGenre(id: 32, name: 'Rhythm Game'),
  GameGenre(id: 33, name: 'Idle/Clicker'),
  GameGenre(id: 34, name: 'Immersive Sim'),
  GameGenre(id: 35, name: 'Walking Sim'),
  GameGenre(id: 36, name: "Beat 'em Up"),
  GameGenre(id: 37, name: 'Sandbox'),
  GameGenre(id: 38, name: 'Drama Interativo'),
];