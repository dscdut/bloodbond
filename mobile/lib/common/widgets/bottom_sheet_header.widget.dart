import 'package:bloodbond/common/extensions/context.extension.dart';
import 'package:bloodbond/common/theme/color_styles.dart';
import 'package:flutter/material.dart';

class BottomSheetHeader extends StatelessWidget {
  const BottomSheetHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25,
      width: context.width,
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: ColorStyles.gray200),
        ),
      ),
      child: Center(
        child: Container(
          width: 80,
          height: 7,
          decoration: BoxDecoration(
            color: ColorStyles.gray300,
            borderRadius: BorderRadius.circular(100),
          ),
        ),
      ),
    );
  }
}
