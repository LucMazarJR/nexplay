# 🎮 NexPlay — Gerenciador de Jogos

App Flutter (Material 3) para catalogar sua coleção de jogos: cadastrar, listar,
abrir e editar. O projeto é construído **em fases**, começando por um MVP enxuto
e validando o ciclo central antes de adicionar qualquer complexidade.

> **Filosofia do roadmap:** cada fase só faz sentido depois que a anterior estiver
> validada. Não antecipe features de fases futuras — se o núcleo não estiver
> gostoso de usar, nada mais importa.

---

## 📋 Visão geral

| Item         | Detalhe                                              |
|--------------|------------------------------------------------------|
| Stack        | Flutter · Dart (`sdk: ^3.12.2`)                     |
| UI           | Material 3 (`useMaterial3: true`)                   |
| Persistência | Local na Fase 1 (sqflite **ou** Hive — a decidir)  |
| Plataformas  | Android (foco inicial)                             |

---

## 🗺️ Roadmap por fases

### Fase 1 · MVP — *Construa isto primeiro*
**O essencial: cadastrar, ver e editar.**

CRUD completo com armazenamento **local**. Sem login, sem nuvem, sem API.
Valida o fluxo central: **adicionar → listar → abrir → editar**.

Telas:
- **Estado vazio** — primeiro uso ("Sua biblioteca está vazia").
- **Lista de jogos** — tela principal com os cards/ListTiles.
- **Adicionar jogo** — formulário (nome, plataforma, status, nota, gênero, anotações, capa).
- **Detalhe do jogo** — visualização e ponto de partida para editar.

Campos de um jogo:
- Nome
- Plataforma
- Status: **Jogando** · **Zerado** · **Desejo**
- Nota (estrelas)
- Gênero
- Anotações
- Capa (imagem da galeria)

### Fase 2 · Organização — *Quando a lista cresce*
**Encontrar e dar sentido à coleção** (só vale com 20+ jogos cadastrados).

- 🔍 **Busca por nome** — filtra a lista enquanto digita.
- 🎛️ **Filtros** — por status, plataforma e gênero (os chips do mockup).
- ↕️ **Ordenação** — por nome, nota ou adicionados recentemente.
- 📊 **Contadores** — quantos jogando / zerados / na lista de desejos.

### Fase 3 · Enriquecimento — *Menos digitação, mais dados*
**Automatizar o cadastro** (envolve API externa e tratamento de erro de rede).

- ☁️ **Capa e infos por API** — busca capa, gênero e plataforma (RAWG ou IGDB).
- ⏱️ **Horas jogadas** — campo extra para acompanhar tempo investido.
- ☰ **Backlog ordenável** — arrastar para priorizar o que jogar a seguir.

### Fase 4 · Nuvem & Social — *Opcional / longo prazo*
**Sincronizar e compartilhar** (exige backend, autenticação e segurança).

- 🔄 **Sync na nuvem** — login + backup (Firebase) para acessar de qualquer aparelho.
- 📤 **Compartilhar coleção** — gerar link ou imagem da biblioteca.
- 📈 **Estatísticas** — resumo do ano: mais jogados, gêneros favoritos, total zerado.

---

## 🎨 Mini sistema de design

Use como referência no Flutter:
`ThemeData` com `ColorScheme.fromSeed(seedColor: Color(0xFF6750A4))`.

### Cores
| Token              | Hex        |
|--------------------|------------|
| primary            | `#6750A4`  |
| primaryContainer   | `#EADDFF`  |
| secondaryContainer | `#E8DEF8`  |
| surface            | `#FEF7FF`  |
| estrelas           | `#E8A23D`  |
| error              | `#B3261E`  |

### Status (cores semânticas)
- **Jogando** → azul
- **Zerado** → verde
- **Desejo** → âmbar

### Tipografia
Roboto — **22** (título) · **16/15** (corpo) · **12** (rótulos)

### Componentes Material 3 de referência
`AppBar` · `ListTile` · `Card` · `FilterChip` · `TextField` (outlined) ·
`SegmentedButton` · `FAB` · `FilledButton`

---

## 🚀 Como rodar

```bash
flutter pub get
flutter run
```

## 📂 Estrutura (inicial)

```
lib/
  main.dart        # ponto de entrada (boilerplate por enquanto)
test/
  widget_test.dart
```

> A organização de pastas (models, screens, repositories, etc.) será definida
> conforme o MVP da Fase 1 for tomando forma.

---

## ✅ Status atual

- [x] Projeto Flutter inicializado
- [ ] **Fase 1 — MVP** (em andamento)
- [ ] Fase 2 — Organização
- [ ] Fase 3 — Enriquecimento
- [ ] Fase 4 — Nuvem & Social
