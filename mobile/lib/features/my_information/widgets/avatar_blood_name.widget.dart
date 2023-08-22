import 'package:bloodbond/common/theme/text_styles.dart';
import 'package:bloodbond/generated/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AvatarBloodName extends StatelessWidget {
  const AvatarBloodName({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            ClipOval(
              child: Assets.icons.profile.avatar.image(
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 30.h,
        ),
        Text(
          'Happy Child',
          style: TextStyles.boldText.copyWith(fontSize: 26),
        ),
      ],
    );
  }
}
