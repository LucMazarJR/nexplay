class GameTag {
  final String name;
  final String type;

  const GameTag({required this.name, required this.type});
}

// Mock por enquanto, depois isso vira uma tabela no banco (tags + type).
final List<GameTag> gameTagsSeed = [
  // Estilo (modificadores de gênero, um jogo pode ter várias)
  GameTag(name: 'Souls-like', type: 'Estilo'),
  GameTag(name: 'Metroidvania', type: 'Estilo'),
  GameTag(name: 'Roguelike', type: 'Estilo'),
  GameTag(name: 'Roguelite', type: 'Estilo'),
  GameTag(name: 'Deck-building', type: 'Estilo'),
  GameTag(name: 'Stealth', type: 'Estilo'),
  GameTag(name: 'Boomer Shooter', type: 'Estilo'),
  GameTag(name: 'Looter Shooter', type: 'Estilo'),
  GameTag(name: 'Extraction Shooter', type: 'Estilo'),
  GameTag(name: 'Musou', type: 'Estilo'),

  // Perspectiva
  GameTag(name: '2D', type: 'Perspectiva'),
  GameTag(name: '3D', type: 'Perspectiva'),
  GameTag(name: '2.5D', type: 'Perspectiva'),
  GameTag(name: 'Pixel Art', type: 'Perspectiva'),
  GameTag(name: 'Isométrico', type: 'Perspectiva'),
  GameTag(name: 'Primeira Pessoa', type: 'Perspectiva'),
  GameTag(name: 'Terceira Pessoa', type: 'Perspectiva'),
  GameTag(name: 'Top-down', type: 'Perspectiva'),
  GameTag(name: 'Side-scroller', type: 'Perspectiva'),

  // Mundo
  GameTag(name: 'Mundo Aberto', type: 'Mundo'),
  GameTag(name: 'Fases', type: 'Mundo'),
  GameTag(name: 'Procedural', type: 'Mundo'),
  GameTag(name: 'Hub World', type: 'Mundo'),

  // Multiplayer
  GameTag(name: 'Singleplayer', type: 'Multiplayer'),
  GameTag(name: 'Multiplayer Local', type: 'Multiplayer'),
  GameTag(name: 'Multiplayer Online', type: 'Multiplayer'),
  GameTag(name: 'Co-op', type: 'Multiplayer'),
  GameTag(name: 'Co-op Assimétrico', type: 'Multiplayer'),
  GameTag(name: 'PvP', type: 'Multiplayer'),
  GameTag(name: 'PvE', type: 'Multiplayer'),
  GameTag(name: 'MMO', type: 'Multiplayer'),
  GameTag(name: 'Assíncrono', type: 'Multiplayer'),

  // Progressão
  GameTag(name: 'Crafting', type: 'Progressão'),
  GameTag(name: 'Construção', type: 'Progressão'),
  GameTag(name: 'Skill Tree', type: 'Progressão'),
  GameTag(name: 'Sistema de Níveis', type: 'Progressão'),
  GameTag(name: 'Loot', type: 'Progressão'),
  GameTag(name: 'Gacha', type: 'Progressão'),
  GameTag(name: 'Permadeath', type: 'Progressão'),
  GameTag(name: 'Ciclo Dia/Noite', type: 'Progressão'),
  GameTag(name: 'Clima Dinâmico', type: 'Progressão'),
  GameTag(name: 'Survival', type: 'Progressão'),
  GameTag(name: 'Gerência de Recursos', type: 'Progressão'),
  GameTag(name: 'New Game+', type: 'Progressão'),
  GameTag(name: 'Customização de Personagem', type: 'Progressão'),
  GameTag(name: 'Sistema de Facções', type: 'Progressão'),
  GameTag(name: 'Conquistas', type: 'Progressão'),

  // Narrativa
  GameTag(name: 'Escolhas e Consequências', type: 'Narrativa'),
  GameTag(name: 'Múltiplos Finais', type: 'Narrativa'),
  GameTag(name: 'Não Linear', type: 'Narrativa'),
  GameTag(name: 'Foco em História', type: 'Narrativa'),
  GameTag(name: 'Mistério', type: 'Narrativa'),
  GameTag(name: 'Diálogo Ramificado', type: 'Narrativa'),
  GameTag(name: 'Sem Diálogos', type: 'Narrativa'),
  GameTag(name: 'Sem Narrativa', type: 'Narrativa'),

  // Dificuldade e Ritmo
  GameTag(name: 'Difícil', type: 'Dificuldade'),
  GameTag(name: 'Casual', type: 'Dificuldade'),
  GameTag(name: 'Relaxante', type: 'Dificuldade'),
  GameTag(name: 'Sem Combate', type: 'Dificuldade'),
  GameTag(name: 'Tempo Real', type: 'Dificuldade'),
  GameTag(name: 'Por Turnos', type: 'Dificuldade'),
  GameTag(name: 'Fast-paced', type: 'Dificuldade'),

  // Arte e Atmosfera
  GameTag(name: 'Estilizado', type: 'Atmosfera'),
  GameTag(name: 'Realista', type: 'Atmosfera'),
  GameTag(name: 'Cartoon', type: 'Atmosfera'),
  GameTag(name: 'Anime', type: 'Atmosfera'),
  GameTag(name: 'Noir', type: 'Atmosfera'),
  GameTag(name: 'Low Poly', type: 'Atmosfera'),
  GameTag(name: 'Dark Fantasy', type: 'Atmosfera'),
  GameTag(name: 'Cyberpunk', type: 'Atmosfera'),
  GameTag(name: 'Steampunk', type: 'Atmosfera'),
  GameTag(name: 'Pós-apocalíptico', type: 'Atmosfera'),
  GameTag(name: 'Fantasia Medieval', type: 'Atmosfera'),
  GameTag(name: 'Sci-fi', type: 'Atmosfera'),
  GameTag(name: 'Horror Psicológico', type: 'Atmosfera'),
  GameTag(name: 'Atmosférico', type: 'Atmosfera'),
  GameTag(name: 'Minimalista', type: 'Atmosfera'),
  GameTag(name: 'Cozy', type: 'Atmosfera'),

  // Replay
  GameTag(name: 'Alta Rejogabilidade', type: 'Replay'),
  GameTag(name: 'Runs Curtas', type: 'Replay'),
  GameTag(name: 'Seeds', type: 'Replay'),
  GameTag(name: 'Speedrun-friendly', type: 'Replay'),

  // Suporte
  GameTag(name: 'Mods', type: 'Suporte'),
  GameTag(name: 'Cross-save', type: 'Suporte'),
  GameTag(name: 'Controle', type: 'Suporte'),
  GameTag(name: 'Steam Deck', type: 'Suporte'),
];