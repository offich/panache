import 'package:flutter/material.dart';

// Note: need to rename prefix
class PanacheIconButton extends StatelessWidget {
  final Color color;
  final VoidCallback? onPressed;
  final Icon icon;

  const PanacheIconButton({
    super.key,
    required this.color,
    this.onPressed,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.all(0.0),
      icon: icon,
      color: color,
      hoverColor: color.withValues(alpha: 0.1),
      onPressed: onPressed,
    );
  }
}
