import 'package:bloodbond/common/theme/color_styles.dart';
import 'package:bloodbond/common/theme/text_styles.dart';
import 'package:bloodbond/common/widgets/common_rounded_button.widget.dart';
import 'package:bloodbond/common/widgets/common_text_form_field.widget.dart';
import 'package:bloodbond/features/auth/widgets/login_text.widget.dart';
import 'package:bloodbond/generated/locale_keys.g.dart';
import 'package:bloodbond/router/app_router.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    super.key,
  });
  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      // key: widget.formKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 35),
            child: LoginCustomText(
              text: LocaleKeys.texts_email.tr(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(40, 5, 40, 0),
            child: AppTextFormField(
              hintText: LocaleKeys.validator_email_required.tr(),
              fillColor: ColorStyles.concrete,
              hintColor: ColorStyles.silver,
              borderRadius: 20,
              contentPadding: const EdgeInsets.symmetric(
                vertical: 18,
                horizontal: 22,
              ),
              onChanged: (value) {
                // Handle onChanged event
              },
              // Add any other required parameters
            ),
          ),
          LoginCustomText(
            text: LocaleKeys.texts_password.tr(),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(40, 5, 40, 0),
            child: AppTextFormField(
              hintText: LocaleKeys.validator_password_required.tr(),
              fillColor: ColorStyles.concrete,
              hintColor: ColorStyles.silver,
              borderRadius: 20,
              contentPadding: const EdgeInsets.symmetric(
                vertical: 18,
                horizontal: 22,
              ),
              onChanged: (value) {
                // Handle onChanged event
              },
              // Add any other required parameters
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: SizedBox(
              width: 250,
              height: 45,
              child: CommonRoundedButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    AppRouter.root,
                    (route) => false,
                  );
                },
                backgroundColor: ColorStyles.primary,
                content: LocaleKeys.auth_login.tr(),
                textStyle: TextStyles.s17BoldText.copyWith(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AppRouter.forgotPassword);
            },
            style: ButtonStyle(
              overlayColor:
                  MaterialStateProperty.all<Color>(Colors.transparent),
            ),
            child: Text(
              LocaleKeys.auth_forgot_password.tr(),
              style: TextStyles.s17MediumText.copyWith(
                color: ColorStyles.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
