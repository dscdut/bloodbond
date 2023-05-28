import 'package:bloodbond/common/theme/app_size.dart';
import 'package:bloodbond/generated/assets.gen.dart';
import 'package:flutter/material.dart';

class BloodIcon extends StatelessWidget {
  const BloodIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSize.buttonAndTextFieldHeight,
      height: AppSize.buttonAndTextFieldHeight,
      padding: const EdgeInsets.all(13),
      transform: Matrix4.translationValues(-10, 0, 0),
      child: Assets.icons.request.blood.svg(),
    );
  }
}
