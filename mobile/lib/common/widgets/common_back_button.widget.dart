import 'package:flutter/material.dart';
import 'package:bloodbond/common/theme/color_styles.dart';
import 'package:bloodbond/common/widgets/common_icon_button.widget.dart';

class CommonBackButton extends StatelessWidget {
  const CommonBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CommonIconButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      icon: Icons.chevron_left_rounded,
      iconColor: ColorStyles.primary,
    );
  }
}
