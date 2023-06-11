import 'package:bloodbond/common/constants/blood_enum.dart';
import 'package:bloodbond/common/theme/text_styles.dart';
import 'package:bloodbond/common/widgets/blood_type.widget.dart';
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
              child: Image.network(
                'https://images.thedirect.com/media/article_full/avatar-sons.jpg',
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              bottom: -15,
              right: -10,
              child: BloodTypeWidget(
                bloodType: BloodType.abPlus.name,
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
