import 'package:flutter/material.dart';
import 'package:bloodbond/common/theme/color_styles.dart';

class CommonBackButton extends StatelessWidget {
  const CommonBackButton({
    super.key,
    this.hasBoxDecoration = true,
  });
  final bool hasBoxDecoration;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: GestureDetector(
        onTap: () => Navigator.of(context).pop(),
        child: Container(
          constraints: const BoxConstraints(
            maxWidth: 40,
            maxHeight: 40,
          ),
          decoration: hasBoxDecoration
              ? BoxDecoration(
                  color: ColorStyles.backgroundAppbar,
                  borderRadius: BorderRadius.circular(5),
                )
              : const BoxDecoration(),
          child: const Icon(
            Icons.chevron_left_outlined,
            color: ColorStyles.zodiacBlue,
            size: 35,
          ),
        ),
      ),
    );
  }
}
