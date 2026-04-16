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

- Busca avançada de jogos
- Seleção aleatória de jogos da wishlist

## Tecnologias

- **Flutter** - Framework mobile multiplataforma
- **Firebase** - Backend, autenticação e banco de dados
- **RAWG API** - Base de dados de jogos
- **Dart** - Linguagem de programação

## Como Começar

```bash
# Clone o repositório
git clone [seu-repositorio]

# Crie o arquivo de ambiente baseado no exemplo
# (copie .env.example para .env)

# Adicione sua chave da RAWG no .env
# RAWG_API_KEY=...

# Instale as dependências
flutter pub get

# Execute o app
flutter run
```

## Login

- O app usa login com **Firebase Authentication (Email/Senha)**.
- Nao ha tela de registro no app: crie os usuarios diretamente no console do Firebase.

## Configuracao Firebase (local)

- Este repositorio nao versiona arquivos sensiveis do Firebase.
- Adicione localmente o arquivo `android/app/google-services.json` do seu projeto Firebase.
- Se for usar iOS/macOS, adicione localmente `GoogleService-Info.plist` nas pastas da plataforma.

## Plataforma

- Android

## Disciplina

**DESENVOLVIMENTO DE SOFTWARE PARA DISPOSITIVOS MÓVEIS I**

---

Desenvolvido com 💖 em Flutter.
