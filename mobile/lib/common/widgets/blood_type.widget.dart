import 'package:bloodbond/common/theme/text_styles.dart';
import 'package:bloodbond/generated/assets.gen.dart';
import 'package:flutter/material.dart';

class BloodTypeWidget extends StatelessWidget {
  const BloodTypeWidget({super.key, required this.bloodType});

  final String bloodType;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Assets.icons.profile.bloodType.svg(),
        Positioned(
          top: 23,
          child: SizedBox(
            width: 40,
            child: Text(
              bloodType,
              style: TextStyles.boldText.copyWith(
                fontSize: 18,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        )
      ],
    );
  }
}
