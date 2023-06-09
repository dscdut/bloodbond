import 'package:bloodbond/common/theme/color_styles.dart';
import 'package:bloodbond/common/theme/text_styles.dart';
import 'package:bloodbond/features/my_certificate/my_certificate.dart';
import 'package:bloodbond/generated/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BloodInfoItem extends StatelessWidget {
  const BloodInfoItem({super.key, required this.items, required this.index});

  final List<BloodItemModel> items;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: ColorStyles.red300,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Assets.icons.profile.power.svg(),
            Text(
              items[index].title,
              style: TextStyles.boldText.copyWith(
                color: ColorStyles.gray,
                fontSize: 12.sp,
              ),
            ),
            Text(
              items[index].content,
              style: TextStyles.regularText.copyWith(
                color: ColorStyles.gray,
                fontSize: 12.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}