import 'package:bloodbond/common/extensions/context.extension.dart';
import 'package:bloodbond/features/auth/widgets/login_text.widget.dart';
import 'package:bloodbond/generated/assets.gen.dart';
import 'package:bloodbond/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ForgotPasswordHeader extends StatefulWidget {
  const ForgotPasswordHeader({
    super.key,
  });
  @override
  State<ForgotPasswordHeader> createState() => _ForgotPasswordHeaderState();
}

class _ForgotPasswordHeaderState extends State<ForgotPasswordHeader> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: SizedBox(
            width: context.width * 0.75,
            child: Assets.icons.launcher.appIcon.image(
              fit: BoxFit.contain,
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        LoginCustomText(
          text: LocaleKeys.auth_forgot_password.tr(),
          fontSize: 22,
        ),
        const SizedBox(
          height: 10,
        ),
        LoginCustomText(
          text: LocaleKeys.texts_email_verification_prompt.tr(),
          fontSize: 15,
          fontWeight: FontWeight.w400,
        ),
        const SizedBox(
          height: 30,
        ),
      ],
    );
  }
}
