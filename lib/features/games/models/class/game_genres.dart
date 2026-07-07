// Campo único de seleção no cadastro do jogo. Depois vira tabela GameGenres no SQLite.

class GameGenre {
  final String name;

  const GameGenre({
    required this.name,
  });
}

final List<GameGenre> genresSeed = [
  GameGenre(name: 'RPG'),
  GameGenre(name: 'RPG de Ação'),
  GameGenre(name: 'RPG Tático'),
  GameGenre(name: 'JRPG'),
  GameGenre(name: 'Plataforma'),
  GameGenre(name: 'Hack and Slash'),
  GameGenre(name: 'Survival Horror'),
  GameGenre(name: 'Battle Royale'),
  GameGenre(name: 'MOBA'),
  GameGenre(name: 'FPS'),
  GameGenre(name: 'TPS'),
  GameGenre(name: 'Simulador'),
  GameGenre(name: 'Simulador de Vida'),
  GameGenre(name: 'Farming Sim'),
  GameGenre(name: 'Tycoon'),
  GameGenre(name: 'City Builder'),
  GameGenre(name: 'Tower Defense'),
  GameGenre(name: 'Dungeon Crawler'),
  GameGenre(name: 'Puzzle'),
  GameGenre(name: 'Visual Novel'),
  GameGenre(name: 'Point and Click'),
  GameGenre(name: 'Luta'),
  GameGenre(name: 'Corrida'),
  GameGenre(name: 'Esporte'),
  GameGenre(name: 'Estratégia'),
  GameGenre(name: 'RTS'),
  GameGenre(name: 'Estratégia por Turnos'),
  GameGenre(name: '4X'),
  GameGenre(name: 'Card Game'),
  GameGenre(name: 'Auto Battler'),
  GameGenre(name: 'Party Game'),
  GameGenre(name: 'Rhythm Game'),
  GameGenre(name: 'Idle/Clicker'),
  GameGenre(name: 'Immersive Sim'),
  GameGenre(name: 'Walking Sim'),
  GameGenre(name: "Beat 'em Up"),
  GameGenre(name: 'Sandbox'),
  GameGenre(name: 'Drama Interativo'),
];