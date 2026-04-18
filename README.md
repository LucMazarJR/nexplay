# Nexplay

Um gerenciador de jogos com wishlist desenvolvido em **Flutter** como projeto para a disciplina de _Desenvolvimento de Software para Dispositivos Móveis I_.

## Objetivo

Este projeto tem como objetivo **aprender Flutter e desenvolvimento mobile** enquanto se constrói uma aplicação funcional para gerenciar uma biblioteca pessoal de jogos com sistema de desejos (wishlist).

## Funcionalidades

### Implementadas

- **Autenticação com Firebase** - Login seguro para sincronização de dados do usuário
- **Integração com RAWG API** - Busca de dados de jogos em tempo real
- **Sistema de Wishlist** - Salve seus jogos favoritos
- **Persistência de Dados** - Dados do usuário salvos no Firebase

### Em Desenvolvimento

# Nexplay

Gerenciador de jogos com wishlist desenvolvido em Flutter para a disciplina de Desenvolvimento de Software para Dispositivos Moveis I.

## Objetivo

Construir um app mobile funcional para catalogar jogos, pesquisar novos titulos e manter uma wishlist pessoal, aplicando boas praticas de arquitetura com Flutter.

## O que foi feito

- Autenticacao com Firebase (login por email e senha).
- Integracao com RAWG API para listagem e detalhes de jogos.
- Tela de listagem com filtros por plataforma.
- Tela de detalhes do jogo.
- Estrutura em MVVM nas features principais.
- Configuracao de ambiente com `.env.example` para a chave da RAWG.
- Ajuste de estabilidade no core (correcao de crash de build).

## Funcionalidades

### Implementadas

- Login com Firebase Authentication.
- Listagem de jogos consumindo RAWG.
- Filtros de jogos por plataforma.
- Visualizacao de detalhes de cada jogo.
- Wishlist e persistencia de dados do usuario.

### Em desenvolvimento

- Busca avancada de jogos.
- Selecao aleatoria de jogos da wishlist.

## Tecnologias

- Flutter
- Dart
- Firebase (Auth e Firestore)
- RAWG API

## Como rodar

```bash
# Clone o repositorio
git clone <url-do-repositorio>

# Entre na pasta
cd nexplay

# Crie o .env a partir do exemplo
cp .env.example .env

# No .env, informe a chave da RAWG
# RAWG_API_KEY=...

# Instale as dependencias
flutter pub get

# Execute o app
flutter run
```

## Configuracao de login

- O app usa Firebase Authentication (email/senha).
- Nao ha tela de cadastro no app.
- Crie usuarios diretamente no console do Firebase.

## Configuracao Firebase local

- O repositorio nao versiona arquivos sensiveis.
- Adicione localmente `android/app/google-services.json`.
- Para iOS/macOS, adicione `GoogleService-Info.plist` nas pastas da plataforma.

## Plataforma alvo

- Android

## Disciplina

Desenvolvimento de Software para Dispositivos Moveis I
