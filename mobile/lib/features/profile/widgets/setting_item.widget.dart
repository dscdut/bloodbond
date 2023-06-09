import 'package:bloodbond/common/theme/color_styles.dart';
import 'package:bloodbond/common/theme/text_styles.dart';
import 'package:bloodbond/features/profile/widgets/custom_switch.widget.dart';
import 'package:bloodbond/generated/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingItem extends StatefulWidget {
  const SettingItem({
    super.key,
    required this.icon,
    required this.title,
    this.hasSwitch = false,
    this.hasArrow = false,
  });

  final SvgGenImage icon;
  final String title;
  final bool hasSwitch;
  final bool hasArrow;

  @override
  State<SettingItem> createState() => _SettingItemState();
}

class _SettingItemState extends State<SettingItem> {
  final double _height = 55.h;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _height,
      padding: const EdgeInsets.fromLTRB(0, 0, 18, 0),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 26,
            spreadRadius: -6,
            color: const Color(0xFF565656).withOpacity(0.12),
          )
        ],
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        children: [
          Container(
            width: _height,
            height: _height,
            padding: EdgeInsets.all(18.h),
            child: widget.icon.svg(),
          ),
          Expanded(
            child: Text(
              widget.title,
              style: TextStyles.s14MediumText.copyWith(color: ColorStyles.gray),
            ),
          ),
          if (widget.hasSwitch)
            CustomSwitch(
              value: true,
              width: 36.75.w,
              height: 21.h,
              toggleSize: 19.h,
              padding: 2.w,
              onToggle: (value) {},
              activeColor: ColorStyles.primary,
            )
          else if (widget.hasArrow)
            SizedBox(
              width: 30.w,
              height: 22.h,
              child: Center(child: Assets.icons.profile.leftArrow.svg()),
            )
        ],
      ),
    );
  }
}
