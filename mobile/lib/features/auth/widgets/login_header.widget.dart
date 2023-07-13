import 'package:bloodbond/common/extensions/context.extension.dart';
import 'package:bloodbond/features/auth/widgets/login_text.widget.dart';
import 'package:bloodbond/generated/assets.gen.dart';
import 'package:bloodbond/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LoginHeader extends StatefulWidget {
  const LoginHeader({
    super.key,
  });
  @override
  State<LoginHeader> createState() => _LoginHeaderState();
}

class _LoginHeaderState extends State<LoginHeader> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: SizedBox(
            width: context.width * 0.6,
            child: Assets.icons.launcher.appIcon.image(
              fit: BoxFit.contain,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: LoginCustomText(
            text: LocaleKeys.auth_login.tr(),
            fontSize: 23,
          ),
        ),
        LoginCustomText(
          text: LocaleKeys.texts_login_prompt.tr(),
          fontSize: 15,
          fontWeight: FontWeight.w400,
        ),
      ],
    );
  }
}
