import 'package:flutter/material.dart';
import 'package:bloodbond/common/theme/color_styles.dart';

class CommonIconButton extends StatelessWidget {
  const CommonIconButton({
    super.key,
    required this.icon,
    this.iconColor = ColorStyles.zodiacBlue,
    required this.onPressed,
  }) : assert(
          icon != null && (icon is IconData || icon is Widget),
          'Icon must not be null and must be a IconData or Widget',
        );

  final Color iconColor;
  final dynamic icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: icon is IconData
          ? Icon(
              icon,
              color: iconColor,
              size: 28,
            )
          : icon,
      padding: EdgeInsets.zero,
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      highlightColor: Colors.transparent,
      visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
    );
  }
}
