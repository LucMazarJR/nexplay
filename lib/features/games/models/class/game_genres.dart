// Campo único de seleção no cadastro do jogo. Depois vira tabela GameGenress no SQLite.

class GameGenres {
  final int id;
  final String name;

  const GameGenres({
    required this.id,
    required this.name,
  });
}

final List<GameGenres> mockGeneros = [
  GameGenres(id: 1, name: 'RPG'),
  GameGenres(id: 2, name: 'RPG de Ação'),
  GameGenres(id: 3, name: 'RPG Tático'),
  GameGenres(id: 4, name: 'JRPG'),
  GameGenres(id: 5, name: 'Plataforma'),
  GameGenres(id: 6, name: 'Hack and Slash'),
  GameGenres(id: 7, name: 'Survival Horror'),
  GameGenres(id: 8, name: 'Battle Royale'),
  GameGenres(id: 9, name: 'MOBA'),
  GameGenres(id: 10, name: 'FPS'),
  GameGenres(id: 11, name: 'TPS'),
  GameGenres(id: 12, name: 'Simulador'),
  GameGenres(id: 13, name: 'Simulador de Vida'),
  GameGenres(id: 14, name: 'Farming Sim'),
  GameGenres(id: 15, name: 'Tycoon'),
  GameGenres(id: 16, name: 'City Builder'),
  GameGenres(id: 17, name: 'Tower Defense'),
  GameGenres(id: 18, name: 'Dungeon Crawler'),
  GameGenres(id: 19, name: 'Puzzle'),
  GameGenres(id: 20, name: 'Visual Novel'),
  GameGenres(id: 21, name: 'Point and Click'),
  GameGenres(id: 22, name: 'Luta'),
  GameGenres(id: 23, name: 'Corrida'),
  GameGenres(id: 24, name: 'Esporte'),
  GameGenres(id: 25, name: 'Estratégia'),
  GameGenres(id: 26, name: 'RTS'),
  GameGenres(id: 27, name: 'Estratégia por Turnos'),
  GameGenres(id: 28, name: '4X'),
  GameGenres(id: 29, name: 'Card Game'),
  GameGenres(id: 30, name: 'Auto Battler'),
  GameGenres(id: 31, name: 'Party Game'),
  GameGenres(id: 32, name: 'Rhythm Game'),
  GameGenres(id: 33, name: 'Idle/Clicker'),
  GameGenres(id: 34, name: 'Immersive Sim'),
  GameGenres(id: 35, name: 'Walking Sim'),
  GameGenres(id: 36, name: "Beat 'em Up"),
  GameGenres(id: 37, name: 'Sandbox'),
  GameGenres(id: 38, name: 'Drama Interativo'),
];