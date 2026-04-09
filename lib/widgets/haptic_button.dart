import 'package:flutter/material.dart';

import '../core/utils/haptic_utils.dart';

class HapticFilledButton extends StatelessWidget {
  const HapticFilledButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.style,
  });

  final VoidCallback? onPressed;
  final Widget child;
  final ButtonStyle? style;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: style,
      onPressed: onPressed == null
          ? null
          : () {
              lightImpact();
              onPressed!();
            },
      child: child,
    );
  }
}

class HapticIconButton extends StatelessWidget {
  const HapticIconButton({
    super.key,
    required this.onPressed,
    required this.icon,
    this.tooltip,
  });

  final VoidCallback? onPressed;
  final IconData icon;
  final String? tooltip;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      tooltip: tooltip,
      onPressed: onPressed == null
          ? null
          : () {
              selectionClick();
              onPressed!();
            },
      icon: Icon(icon),
    );
  }
}
