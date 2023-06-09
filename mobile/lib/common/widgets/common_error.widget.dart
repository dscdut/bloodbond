import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:bloodbond/common/extensions/context.extension.dart';
import 'package:bloodbond/common/theme/color_styles.dart';
import 'package:bloodbond/common/theme/text_styles.dart';
import 'package:bloodbond/generated/assets.gen.dart';
import 'package:bloodbond/generated/locale_keys.g.dart';

class CommonError extends StatelessWidget {
  const CommonError({super.key, this.error});

  final String? error;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Assets.images.lottie.error.lottie(
            width: context.width / 2,
          ),
          Text(
            error ?? LocaleKeys.texts_error_occur.tr(),
            style: TextStyles.mediumText
                .copyWith(fontSize: 15, color: ColorStyles.red500),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
