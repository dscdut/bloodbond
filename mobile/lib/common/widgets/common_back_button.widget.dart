import 'package:flutter/material.dart';
import 'package:bloodbond/common/theme/color_styles.dart';

class CommonBackButton extends StatelessWidget {
  const CommonBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 10, 0, 10),
      child: GestureDetector(
        onTap: () => Navigator.of(context).pop(),
        child: Container(
          constraints: const BoxConstraints(
            maxWidth: 40,
            maxHeight: 40,
          ),
          decoration: BoxDecoration(
            color: const Color(0xFFE5E5E5),
            borderRadius: BorderRadius.circular(5),
          ),
          child: const Icon(
            Icons.chevron_left_outlined,
            color: ColorStyles.zodiacBlue,
            size: 28,
          ),
        ),
      ),
    );
  }
}
