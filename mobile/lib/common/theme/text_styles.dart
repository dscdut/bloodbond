import 'package:flutter/material.dart';
import 'package:bloodbond/common/theme/color_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class TextStyles {
  // Regular
  static const TextStyle regularText = TextStyle(
    color: ColorStyles.zodiacBlue,
    fontWeight: FontWeight.w400,
  );
  static const TextStyle s11RegularText = TextStyle(
    color: ColorStyles.zodiacBlue,
    fontWeight: FontWeight.w400,
    fontSize: 11,
  );
  static TextStyle s14RegularText = TextStyle(
    color: ColorStyles.zodiacBlue,
    fontWeight: FontWeight.w400,
    fontSize: 14.sp,
  );
  static TextStyle s17RegularText = TextStyle(
    color: ColorStyles.zodiacBlue,
    fontWeight: FontWeight.w400,
    fontSize: 17.sp,
  );

  // Medium
  static const TextStyle mediumText = TextStyle(
    color: ColorStyles.zodiacBlue,
    fontWeight: FontWeight.w500,
  );
  static const TextStyle s11MediumText = TextStyle(
    color: ColorStyles.zodiacBlue,
    fontWeight: FontWeight.w500,
    fontSize: 11,
  );
  static TextStyle s14MediumText = TextStyle(
    color: ColorStyles.zodiacBlue,
    fontWeight: FontWeight.w500,
    fontSize: 14.sp,
  );
  static TextStyle s17MediumText = TextStyle(
    color: ColorStyles.zodiacBlue,
    fontWeight: FontWeight.w500,
    fontSize: 17.sp,
  );

  // Bold
  static const TextStyle boldText = TextStyle(
    color: ColorStyles.zodiacBlue,
    fontWeight: FontWeight.w700,
  );
  static const TextStyle s11BoldText = TextStyle(
    color: ColorStyles.zodiacBlue,
    fontWeight: FontWeight.w700,
    fontSize: 11,
  );
  static TextStyle s14BoldText = TextStyle(
    color: ColorStyles.zodiacBlue,
    fontWeight: FontWeight.w700,
    fontSize: 14.sp,
  );
  static TextStyle s17BoldText = TextStyle(
    color: ColorStyles.zodiacBlue,
    fontWeight: FontWeight.w700,
    fontSize: 17.sp,
  );
}
