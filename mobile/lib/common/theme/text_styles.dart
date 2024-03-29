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
  static TextStyle regularFormBVP = const TextStyle(
    fontFamily: 'BeVietnamPro',
    fontSize: 12,
    color: Color(0xFF4C4C4C),
  );
  static TextStyle smallPoppins1 = const TextStyle(
    fontFamily: 'Poppins',
    fontSize: 11,
    fontWeight: FontWeight.w400,
    color: Color(0xFF7E7E7E),
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
  static TextStyle bVPred = TextStyle(
    color: const Color(0xffFF2744),
    fontWeight: FontWeight.w600,
    fontSize: 15.sp,
    fontFamily: 'BeVietNamPro',
  );

  // Bold
  static const TextStyle boldText = TextStyle(
    color: ColorStyles.zodiacBlue,
    fontWeight: FontWeight.w600,
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
  static TextStyle boldAppbarTitle = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.w600,
    fontSize: 20.sp,
  );
  static TextStyle boldPoppins1 = TextStyle(
    color: Color(0xff272A2F),
    fontWeight: FontWeight.w500,
    fontSize: 15.sp,
    fontFamily: 'Poppins',
  );

  static TextStyle boldPoppins2 = const TextStyle(
    fontFamily: 'Poppins',
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: Color(0xFF7E7E7E),
  );
  static TextStyle boldPoppins3 = const TextStyle(
    fontFamily: 'Poppins',
    fontSize: 12,
    fontWeight: FontWeight.w700,
    color: Color(0xFF7E7E7E),
  );
}
