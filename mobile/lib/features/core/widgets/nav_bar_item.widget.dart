import 'package:bloodbond/common/theme/color_styles.dart';
import 'package:bloodbond/generated/assets.gen.dart';
import 'package:flutter/material.dart';

class NavigationBarItem extends StatelessWidget {
  const NavigationBarItem({
    super.key,
    this.isSelected = false,
    required this.icon,
    required this.onTap,
  });

  final void Function() onTap;
  final bool isSelected;
  final SvgGenImage icon;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.opaque,
        child: Column(
          children: [
            icon.svg(
              colorFilter: isSelected
                  ? const ColorFilter.mode(ColorStyles.primary, BlendMode.srcIn)
                  : null,
            ),
            Container(
              width: 4,
              height: 4,
              margin: const EdgeInsets.only(top: 4),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isSelected ? ColorStyles.primary : Colors.transparent,
              ),
            )
          ],
        ),
      ),
    );
  }
}
