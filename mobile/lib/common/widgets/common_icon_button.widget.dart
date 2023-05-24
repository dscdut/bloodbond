import 'package:flutter/material.dart';
import 'package:bloodbond/common/theme/color_styles.dart';

class CommonIconButton extends StatelessWidget {
  const CommonIconButton({
    super.key,
    required this.icon,
    this.iconColor = ColorStyles.zodiacBlue,
    required this.onPressed,
  });
  final Color iconColor;
  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(
        icon,
        color: iconColor,
        size: 28,
      ),
      padding: EdgeInsets.zero,
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      highlightColor: Colors.transparent,
      visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
    );
  }
}
