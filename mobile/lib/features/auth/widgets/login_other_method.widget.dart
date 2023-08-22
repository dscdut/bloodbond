import 'package:bloodbond/common/theme/text_styles.dart';
import 'package:bloodbond/generated/assets.gen.dart';
import 'package:bloodbond/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LoginOtherMethod extends StatefulWidget {
  const LoginOtherMethod({
    super.key,
  });
  @override
  State<LoginOtherMethod> createState() => _LoginOtherMethodState();
}

class _LoginOtherMethodState extends State<LoginOtherMethod> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(
                    left: 20,
                    right: 10,
                  ),
                  child: const Divider(
                    color: Colors.black,
                    height: 36,
                    thickness: 1,
                  ),
                ),
              ),
              Text(
                LocaleKeys.texts_or_login_with.tr(),
                style: TextStyles.s14MediumText.copyWith(
                  color: Colors.black,
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(
                    left: 10,
                    right: 20,
                  ),
                  child: const Divider(
                    color: Colors.black,
                    height: 36,
                    thickness: 1,
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 40),
                child: IconButton(
                  onPressed: () {},
                  iconSize: 55,
                  icon: Assets.icons.launcher.facebookIcon.svg(),
                ),
              ),
              IconButton(
                onPressed: () {},
                iconSize: 55,
                icon: Assets.icons.launcher.googleIcon.svg(),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40),
                child: IconButton(
                  onPressed: () {},
                  iconSize: 55,
                  icon: Assets.icons.launcher.appleIcon.svg(),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
