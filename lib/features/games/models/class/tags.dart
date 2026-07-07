class Tag {
  final int? id;
  final String name;
  final String type;

  const Tag({this.id ,required this.name, required this.type});
}

// Mock por enquanto, depois isso vira uma tabela no banco (tags + type).
final List<Tag> tagsSeed = [
  // Estilo (modificadores de gênero, um jogo pode ter várias)
  Tag(name: 'Souls-like', type: 'Estilo'),
  Tag(name: 'Metroidvania', type: 'Estilo'),
  Tag(name: 'Roguelike', type: 'Estilo'),
  Tag(name: 'Roguelite', type: 'Estilo'),
  Tag(name: 'Deck-building', type: 'Estilo'),
  Tag(name: 'Stealth', type: 'Estilo'),
  Tag(name: 'Boomer Shooter', type: 'Estilo'),
  Tag(name: 'Looter Shooter', type: 'Estilo'),
  Tag(name: 'Extraction Shooter', type: 'Estilo'),
  Tag(name: 'Musou', type: 'Estilo'),

  // Perspectiva
  Tag(name: '2D', type: 'Perspectiva'),
  Tag(name: '3D', type: 'Perspectiva'),
  Tag(name: '2.5D', type: 'Perspectiva'),
  Tag(name: 'Pixel Art', type: 'Perspectiva'),
  Tag(name: 'Isométrico', type: 'Perspectiva'),
  Tag(name: 'Primeira Pessoa', type: 'Perspectiva'),
  Tag(name: 'Terceira Pessoa', type: 'Perspectiva'),
  Tag(name: 'Top-down', type: 'Perspectiva'),
  Tag(name: 'Side-scroller', type: 'Perspectiva'),

  // Mundo
  Tag(name: 'Mundo Aberto', type: 'Mundo'),
  Tag(name: 'Fases', type: 'Mundo'),
  Tag(name: 'Procedural', type: 'Mundo'),
  Tag(name: 'Hub World', type: 'Mundo'),

  // Multiplayer
  Tag(name: 'Singleplayer', type: 'Multiplayer'),
  Tag(name: 'Multiplayer Local', type: 'Multiplayer'),
  Tag(name: 'Multiplayer Online', type: 'Multiplayer'),
  Tag(name: 'Co-op', type: 'Multiplayer'),
  Tag(name: 'Co-op Assimétrico', type: 'Multiplayer'),
  Tag(name: 'PvP', type: 'Multiplayer'),
  Tag(name: 'PvE', type: 'Multiplayer'),
  Tag(name: 'MMO', type: 'Multiplayer'),
  Tag(name: 'Assíncrono', type: 'Multiplayer'),

  // Progressão
  Tag(name: 'Crafting', type: 'Progressão'),
  Tag(name: 'Construção', type: 'Progressão'),
  Tag(name: 'Skill Tree', type: 'Progressão'),
  Tag(name: 'Sistema de Níveis', type: 'Progressão'),
  Tag(name: 'Loot', type: 'Progressão'),
  Tag(name: 'Gacha', type: 'Progressão'),
  Tag(name: 'Permadeath', type: 'Progressão'),
  Tag(name: 'Ciclo Dia/Noite', type: 'Progressão'),
  Tag(name: 'Clima Dinâmico', type: 'Progressão'),
  Tag(name: 'Survival', type: 'Progressão'),
  Tag(name: 'Gerência de Recursos', type: 'Progressão'),
  Tag(name: 'New Game+', type: 'Progressão'),
  Tag(name: 'Customização de Personagem', type: 'Progressão'),
  Tag(name: 'Sistema de Facções', type: 'Progressão'),
  Tag(name: 'Conquistas', type: 'Progressão'),

  // Narrativa
  Tag(name: 'Escolhas e Consequências', type: 'Narrativa'),
  Tag(name: 'Múltiplos Finais', type: 'Narrativa'),
  Tag(name: 'Não Linear', type: 'Narrativa'),
  Tag(name: 'Foco em História', type: 'Narrativa'),
  Tag(name: 'Mistério', type: 'Narrativa'),
  Tag(name: 'Diálogo Ramificado', type: 'Narrativa'),
  Tag(name: 'Sem Diálogos', type: 'Narrativa'),
  Tag(name: 'Sem Narrativa', type: 'Narrativa'),

  // Dificuldade e Ritmo
  Tag(name: 'Difícil', type: 'Dificuldade'),
  Tag(name: 'Casual', type: 'Dificuldade'),
  Tag(name: 'Relaxante', type: 'Dificuldade'),
  Tag(name: 'Sem Combate', type: 'Dificuldade'),
  Tag(name: 'Tempo Real', type: 'Dificuldade'),
  Tag(name: 'Por Turnos', type: 'Dificuldade'),
  Tag(name: 'Fast-paced', type: 'Dificuldade'),

  // Arte e Atmosfera
  Tag(name: 'Estilizado', type: 'Atmosfera'),
  Tag(name: 'Realista', type: 'Atmosfera'),
  Tag(name: 'Cartoon', type: 'Atmosfera'),
  Tag(name: 'Anime', type: 'Atmosfera'),
  Tag(name: 'Noir', type: 'Atmosfera'),
  Tag(name: 'Low Poly', type: 'Atmosfera'),
  Tag(name: 'Dark Fantasy', type: 'Atmosfera'),
  Tag(name: 'Cyberpunk', type: 'Atmosfera'),
  Tag(name: 'Steampunk', type: 'Atmosfera'),
  Tag(name: 'Pós-apocalíptico', type: 'Atmosfera'),
  Tag(name: 'Fantasia Medieval', type: 'Atmosfera'),
  Tag(name: 'Sci-fi', type: 'Atmosfera'),
  Tag(name: 'Horror Psicológico', type: 'Atmosfera'),
  Tag(name: 'Atmosférico', type: 'Atmosfera'),
  Tag(name: 'Minimalista', type: 'Atmosfera'),
  Tag(name: 'Cozy', type: 'Atmosfera'),

  // Replay
  Tag(name: 'Alta Rejogabilidade', type: 'Replay'),
  Tag(name: 'Runs Curtas', type: 'Replay'),
  Tag(name: 'Seeds', type: 'Replay'),
  Tag(name: 'Speedrun-friendly', type: 'Replay'),

  // Suporte
  Tag(name: 'Mods', type: 'Suporte'),
  Tag(name: 'Cross-save', type: 'Suporte'),
  Tag(name: 'Controle', type: 'Suporte'),
  Tag(name: 'Steam Deck', type: 'Suporte'),
];
