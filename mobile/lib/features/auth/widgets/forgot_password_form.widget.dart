import 'package:bloodbond/common/theme/color_styles.dart';
import 'package:bloodbond/common/widgets/common_text_form_field.widget.dart';
import 'package:bloodbond/features/auth/widgets/login_text.widget.dart';
import 'package:bloodbond/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ForgotPasswordForm extends StatefulWidget {
  const ForgotPasswordForm({
    super.key,
  });
  @override
  State<ForgotPasswordForm> createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends State<ForgotPasswordForm> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LoginCustomText(
          text: LocaleKeys.texts_email.tr(),
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
      ],
    );
  }
}
