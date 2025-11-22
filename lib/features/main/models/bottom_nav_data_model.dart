import 'package:flutter/material.dart';

class BottomNavDataModel {
  final IconData icon;
  final IconData selectedIcon;
  final String label;
  final int badgeCount;

  const BottomNavDataModel({
    required this.icon,
    required this.selectedIcon,
    required this.label,
    this.badgeCount = 0,
  });
}
