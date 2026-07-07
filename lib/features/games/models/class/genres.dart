// Campo único de seleção no cadastro do jogo. Depois vira tabela Genres no SQLite.

class Genre {
  final int? id;
  final String name;

  const Genre({this.id, required this.name});
}

final List<Genre> genresSeed = [
  Genre(name: 'RPG'),
  Genre(name: 'RPG de Ação'),
  Genre(name: 'RPG Tático'),
  Genre(name: 'JRPG'),
  Genre(name: 'Plataforma'),
  Genre(name: 'Hack and Slash'),
  Genre(name: 'Survival Horror'),
  Genre(name: 'Battle Royale'),
  Genre(name: 'MOBA'),
  Genre(name: 'FPS'),
  Genre(name: 'TPS'),
  Genre(name: 'Simulador'),
  Genre(name: 'Simulador de Vida'),
  Genre(name: 'Farming Sim'),
  Genre(name: 'Tycoon'),
  Genre(name: 'City Builder'),
  Genre(name: 'Tower Defense'),
  Genre(name: 'Dungeon Crawler'),
  Genre(name: 'Puzzle'),
  Genre(name: 'Visual Novel'),
  Genre(name: 'Point and Click'),
  Genre(name: 'Luta'),
  Genre(name: 'Corrida'),
  Genre(name: 'Esporte'),
  Genre(name: 'Estratégia'),
  Genre(name: 'RTS'),
  Genre(name: 'Estratégia por Turnos'),
  Genre(name: '4X'),
  Genre(name: 'Card Game'),
  Genre(name: 'Auto Battler'),
  Genre(name: 'Party Game'),
  Genre(name: 'Rhythm Game'),
  Genre(name: 'Idle/Clicker'),
  Genre(name: 'Immersive Sim'),
  Genre(name: 'Walking Sim'),
  Genre(name: "Beat 'em Up"),
  Genre(name: 'Sandbox'),
  Genre(name: 'Drama Interativo'),
];
