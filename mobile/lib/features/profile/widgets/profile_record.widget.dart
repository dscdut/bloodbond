import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileRecord extends StatelessWidget {
  const ProfileRecord({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final itemSize = (constraints.maxWidth - 2 * 35.w) / 3;

        return Padding(
          padding: EdgeInsets.symmetric(vertical: 17.h),
        );
      },
    );
  }
}
