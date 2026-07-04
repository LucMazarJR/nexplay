class GameTag {
  final String nome;
  final String tipo;

  const GameTag({required this.nome, required this.tipo});
}

// Mock por enquanto, depois isso vira uma tabela no banco (tags + tipo).
final List<GameTag> mockGameTags = [
  // Estilo (modificadores de gênero, um jogo pode ter várias)
  GameTag(nome: 'Souls-like', tipo: 'Estilo'),
  GameTag(nome: 'Metroidvania', tipo: 'Estilo'),
  GameTag(nome: 'Roguelike', tipo: 'Estilo'),
  GameTag(nome: 'Roguelite', tipo: 'Estilo'),
  GameTag(nome: 'Deck-building', tipo: 'Estilo'),
  GameTag(nome: 'Stealth', tipo: 'Estilo'),
  GameTag(nome: 'Boomer Shooter', tipo: 'Estilo'),
  GameTag(nome: 'Looter Shooter', tipo: 'Estilo'),
  GameTag(nome: 'Extraction Shooter', tipo: 'Estilo'),
  GameTag(nome: 'Musou', tipo: 'Estilo'),

  // Perspectiva
  GameTag(nome: '2D', tipo: 'Perspectiva'),
  GameTag(nome: '3D', tipo: 'Perspectiva'),
  GameTag(nome: '2.5D', tipo: 'Perspectiva'),
  GameTag(nome: 'Pixel Art', tipo: 'Perspectiva'),
  GameTag(nome: 'Isométrico', tipo: 'Perspectiva'),
  GameTag(nome: 'Primeira Pessoa', tipo: 'Perspectiva'),
  GameTag(nome: 'Terceira Pessoa', tipo: 'Perspectiva'),
  GameTag(nome: 'Top-down', tipo: 'Perspectiva'),
  GameTag(nome: 'Side-scroller', tipo: 'Perspectiva'),

  // Mundo
  GameTag(nome: 'Mundo Aberto', tipo: 'Mundo'),
  GameTag(nome: 'Fases', tipo: 'Mundo'),
  GameTag(nome: 'Procedural', tipo: 'Mundo'),
  GameTag(nome: 'Hub World', tipo: 'Mundo'),

  // Multiplayer
  GameTag(nome: 'Singleplayer', tipo: 'Multiplayer'),
  GameTag(nome: 'Multiplayer Local', tipo: 'Multiplayer'),
  GameTag(nome: 'Multiplayer Online', tipo: 'Multiplayer'),
  GameTag(nome: 'Co-op', tipo: 'Multiplayer'),
  GameTag(nome: 'Co-op Assimétrico', tipo: 'Multiplayer'),
  GameTag(nome: 'PvP', tipo: 'Multiplayer'),
  GameTag(nome: 'PvE', tipo: 'Multiplayer'),
  GameTag(nome: 'MMO', tipo: 'Multiplayer'),
  GameTag(nome: 'Assíncrono', tipo: 'Multiplayer'),

  // Progressão
  GameTag(nome: 'Crafting', tipo: 'Progressão'),
  GameTag(nome: 'Construção', tipo: 'Progressão'),
  GameTag(nome: 'Skill Tree', tipo: 'Progressão'),
  GameTag(nome: 'Sistema de Níveis', tipo: 'Progressão'),
  GameTag(nome: 'Loot', tipo: 'Progressão'),
  GameTag(nome: 'Gacha', tipo: 'Progressão'),
  GameTag(nome: 'Permadeath', tipo: 'Progressão'),
  GameTag(nome: 'Ciclo Dia/Noite', tipo: 'Progressão'),
  GameTag(nome: 'Clima Dinâmico', tipo: 'Progressão'),
  GameTag(nome: 'Survival', tipo: 'Progressão'),
  GameTag(nome: 'Gerência de Recursos', tipo: 'Progressão'),
  GameTag(nome: 'New Game+', tipo: 'Progressão'),
  GameTag(nome: 'Customização de Personagem', tipo: 'Progressão'),
  GameTag(nome: 'Sistema de Facções', tipo: 'Progressão'),
  GameTag(nome: 'Conquistas', tipo: 'Progressão'),

  // Narrativa
  GameTag(nome: 'Escolhas e Consequências', tipo: 'Narrativa'),
  GameTag(nome: 'Múltiplos Finais', tipo: 'Narrativa'),
  GameTag(nome: 'Não Linear', tipo: 'Narrativa'),
  GameTag(nome: 'Foco em História', tipo: 'Narrativa'),
  GameTag(nome: 'Mistério', tipo: 'Narrativa'),
  GameTag(nome: 'Diálogo Ramificado', tipo: 'Narrativa'),
  GameTag(nome: 'Sem Diálogos', tipo: 'Narrativa'),
  GameTag(nome: 'Sem Narrativa', tipo: 'Narrativa'),

  // Dificuldade e Ritmo
  GameTag(nome: 'Difícil', tipo: 'Dificuldade'),
  GameTag(nome: 'Casual', tipo: 'Dificuldade'),
  GameTag(nome: 'Relaxante', tipo: 'Dificuldade'),
  GameTag(nome: 'Sem Combate', tipo: 'Dificuldade'),
  GameTag(nome: 'Tempo Real', tipo: 'Dificuldade'),
  GameTag(nome: 'Por Turnos', tipo: 'Dificuldade'),
  GameTag(nome: 'Fast-paced', tipo: 'Dificuldade'),

  // Arte e Atmosfera
  GameTag(nome: 'Estilizado', tipo: 'Atmosfera'),
  GameTag(nome: 'Realista', tipo: 'Atmosfera'),
  GameTag(nome: 'Cartoon', tipo: 'Atmosfera'),
  GameTag(nome: 'Anime', tipo: 'Atmosfera'),
  GameTag(nome: 'Noir', tipo: 'Atmosfera'),
  GameTag(nome: 'Low Poly', tipo: 'Atmosfera'),
  GameTag(nome: 'Dark Fantasy', tipo: 'Atmosfera'),
  GameTag(nome: 'Cyberpunk', tipo: 'Atmosfera'),
  GameTag(nome: 'Steampunk', tipo: 'Atmosfera'),
  GameTag(nome: 'Pós-apocalíptico', tipo: 'Atmosfera'),
  GameTag(nome: 'Fantasia Medieval', tipo: 'Atmosfera'),
  GameTag(nome: 'Sci-fi', tipo: 'Atmosfera'),
  GameTag(nome: 'Horror Psicológico', tipo: 'Atmosfera'),
  GameTag(nome: 'Atmosférico', tipo: 'Atmosfera'),
  GameTag(nome: 'Minimalista', tipo: 'Atmosfera'),
  GameTag(nome: 'Cozy', tipo: 'Atmosfera'),

  // Replay
  GameTag(nome: 'Alta Rejogabilidade', tipo: 'Replay'),
  GameTag(nome: 'Runs Curtas', tipo: 'Replay'),
  GameTag(nome: 'Seeds', tipo: 'Replay'),
  GameTag(nome: 'Speedrun-friendly', tipo: 'Replay'),

  // Suporte
  GameTag(nome: 'Mods', tipo: 'Suporte'),
  GameTag(nome: 'Cross-save', tipo: 'Suporte'),
  GameTag(nome: 'Controle', tipo: 'Suporte'),
  GameTag(nome: 'Steam Deck', tipo: 'Suporte'),
];