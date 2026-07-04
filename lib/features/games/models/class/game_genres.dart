// Campo único de seleção no cadastro do jogo. Depois vira tabela GameGenress no SQLite.

class GameGenres {
  final int id;
  final String nome;

  const GameGenres({
    required this.id,
    required this.nome,
  });
}

final List<GameGenres> mockGeneros = [
  GameGenres(id: 1, nome: 'RPG'),
  GameGenres(id: 2, nome: 'RPG de Ação'),
  GameGenres(id: 3, nome: 'RPG Tático'),
  GameGenres(id: 4, nome: 'JRPG'),
  GameGenres(id: 5, nome: 'Plataforma'),
  GameGenres(id: 6, nome: 'Hack and Slash'),
  GameGenres(id: 7, nome: 'Survival Horror'),
  GameGenres(id: 8, nome: 'Battle Royale'),
  GameGenres(id: 9, nome: 'MOBA'),
  GameGenres(id: 10, nome: 'FPS'),
  GameGenres(id: 11, nome: 'TPS'),
  GameGenres(id: 12, nome: 'Simulador'),
  GameGenres(id: 13, nome: 'Simulador de Vida'),
  GameGenres(id: 14, nome: 'Farming Sim'),
  GameGenres(id: 15, nome: 'Tycoon'),
  GameGenres(id: 16, nome: 'City Builder'),
  GameGenres(id: 17, nome: 'Tower Defense'),
  GameGenres(id: 18, nome: 'Dungeon Crawler'),
  GameGenres(id: 19, nome: 'Puzzle'),
  GameGenres(id: 20, nome: 'Visual Novel'),
  GameGenres(id: 21, nome: 'Point and Click'),
  GameGenres(id: 22, nome: 'Luta'),
  GameGenres(id: 23, nome: 'Corrida'),
  GameGenres(id: 24, nome: 'Esporte'),
  GameGenres(id: 25, nome: 'Estratégia'),
  GameGenres(id: 26, nome: 'RTS'),
  GameGenres(id: 27, nome: 'Estratégia por Turnos'),
  GameGenres(id: 28, nome: '4X'),
  GameGenres(id: 29, nome: 'Card Game'),
  GameGenres(id: 30, nome: 'Auto Battler'),
  GameGenres(id: 31, nome: 'Party Game'),
  GameGenres(id: 32, nome: 'Rhythm Game'),
  GameGenres(id: 33, nome: 'Idle/Clicker'),
  GameGenres(id: 34, nome: 'Immersive Sim'),
  GameGenres(id: 35, nome: 'Walking Sim'),
  GameGenres(id: 36, nome: "Beat 'em Up"),
  GameGenres(id: 37, nome: 'Sandbox'),
  GameGenres(id: 38, nome: 'Drama Interativo'),
];