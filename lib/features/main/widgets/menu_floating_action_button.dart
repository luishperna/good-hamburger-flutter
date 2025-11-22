import 'package:flutter/material.dart';

class MenuFloatingActionButton extends StatelessWidget {
  final VoidCallback onPressed;

  const MenuFloatingActionButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SizedBox(
      height: 64,
      width: 64,
      child: FloatingActionButton(
        onPressed: onPressed,
        backgroundColor: theme.primaryColor,
        elevation: 8,
        shape: const CircleBorder(),
        child: const Icon(
          Icons.fastfood_rounded,
          size: 30,
          color: Colors.white,
        ),
      ),
    );
  }
}
