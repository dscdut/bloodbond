import 'package:bloodbond/common/theme/text_styles.dart';
import 'package:bloodbond/common/widgets/icon_title.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AvatarNameLocation extends StatelessWidget {
  const AvatarNameLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(
            'https://images.thedirect.com/media/article_full/avatar-sons.jpg',
            width: 90,
            height: 90,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(
          height: 30.h,
        ),
        Text(
          'Fahim Ekan',
          style: TextStyles.mediumText.copyWith(fontSize: 26),
        ),
        const IconTitle(
          icon: Icons.fmd_good_outlined,
          title: 'Chittagong, Bangladesh',
        )
      ],
    );
  }
}
