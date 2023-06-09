import 'package:bloodbond/common/theme/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AvatarNameLocation extends StatelessWidget {
  const AvatarNameLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          // borderRadius: BorderRadius.circular(10),
          // border lại thành hình tròn
          borderRadius: BorderRadius.circular(100),
          child: Image.network(
            'https://images.thedirect.com/media/article_full/avatar-sons.jpg',
            width: 105,
            height: 105,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(
          height: 30.h,
        ),
        Text(
          'Fahim Ekan',
          style: TextStyles.mediumText.copyWith(
            fontSize: 26,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/icons/profile/QR_code.png',
                width: 92.w,
                height: 92.h,
              ),
              SizedBox(
                width: 20.w,
              ),
              Flexible(
                child: Text(
                  '0x61391dBA277dA6ffC2856528E02cB603aE7fe7A9',
                  style: TextStyles.s14MediumText.copyWith(
                    color: const Color(0xFF272A2F),
                    fontSize: 18,
                    height: 1.5, // Giá trị line height mong muốn
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
