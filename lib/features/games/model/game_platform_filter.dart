import 'package:flutter/material.dart';

class GamePlatformFilter {
  const GamePlatformFilter({
    required this.id,
    required this.label,
    required this.icon,
  });

  final int id;
  final String label;
  final IconData icon;

  static const List<GamePlatformFilter> options = [
    GamePlatformFilter(
      id: 1,
      label: 'PC',
      icon: Icons.desktop_windows_outlined,
    ),
    GamePlatformFilter(id: 2, label: 'PlayStation', icon: Icons.sports_esports),
    GamePlatformFilter(id: 3, label: 'Xbox', icon: Icons.gamepad_outlined),
    GamePlatformFilter(id: 7, label: 'Nintendo', icon: Icons.catching_pokemon),
    GamePlatformFilter(
      id: 8,
      label: 'Android',
      icon: Icons.phone_android_outlined,
    ),
  ];
}
