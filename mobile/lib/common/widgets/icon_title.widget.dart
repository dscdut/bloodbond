import 'package:bloodbond/common/theme/color_styles.dart';
import 'package:bloodbond/common/theme/text_styles.dart';
import 'package:flutter/material.dart';

class IconTitle extends StatelessWidget {
  const IconTitle({
    super.key,
    required this.icon,
    required this.title,
  });

  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: ColorStyles.primary,
        ),
        const SizedBox(
          width: 8,
        ),
        Text(
          title,
          style: TextStyles.s14MediumText.copyWith(color: ColorStyles.gray),
        )
      ],
    );
  }
}
