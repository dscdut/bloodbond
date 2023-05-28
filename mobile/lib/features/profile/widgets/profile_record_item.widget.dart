import 'package:bloodbond/common/theme/color_styles.dart';
import 'package:bloodbond/common/theme/text_styles.dart';
import 'package:flutter/material.dart';

class ProfileRecordItem extends StatelessWidget {
  const ProfileRecordItem({
    super.key,
    required this.size,
    required this.title,
    required this.subTitle,
  });

  final double size;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF535353).withOpacity(0.15),
            offset: const Offset(0, 6),
            blurRadius: 47,
            spreadRadius: -16,
          )
        ],
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyles.mediumText.copyWith(fontSize: 30),
          ),
          Text(
            subTitle,
            style: TextStyles.s14RegularText.copyWith(color: ColorStyles.gray),
          )
        ],
      ),
    );
  }
}
