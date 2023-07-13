import 'package:bloodbond/common/extensions/context.extension.dart';
import 'package:bloodbond/common/theme/color_styles.dart';
import 'package:bloodbond/common/theme/text_styles.dart';
import 'package:bloodbond/common/widgets/common_app_bar.widget.dart';
import 'package:bloodbond/common/widgets/common_rounded_button.widget.dart';
import 'package:bloodbond/features/auth/auth.dart';
import 'package:bloodbond/features/auth/bloc/forgot_password/forgot_password.bloc.dart';
import 'package:bloodbond/features/auth/widgets/forgot_password_form.widget.dart';
import 'package:bloodbond/features/auth/widgets/forgot_password_header.widget.dart';
import 'package:bloodbond/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ForgotPasswordBloc(
        authBloc: context.read(),
        userRepository: context.read(),
      ),
      child: const _ForgotPasswordView(),
    );
  }
}

class _ForgotPasswordView extends StatelessWidget {
  const _ForgotPasswordView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        toolbarHeight: kToolbarHeight + context.paddingTop - 60,
        hasBoxDecoration: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const ForgotPasswordHeader(),
            const ForgotPasswordForm(),
            SizedBox(
              height: context.sizeBoxHeight,
            ),
            SizedBox(
              width: 250,
              height: 45,
              child: SizedBox(
                width: 250,
                height: 45,
                child: CommonRoundedButton(
                  onPressed: () {},
                  backgroundColor: ColorStyles.primary,
                  content: LocaleKeys.button_send.tr(),
                  textStyle: TextStyles.s17BoldText.copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(
                  bottom:
                      context.paddingBottom > 0 ? context.paddingBottom : 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
