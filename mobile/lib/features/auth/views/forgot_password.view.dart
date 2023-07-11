import 'package:bloodbond/common/extensions/context.extension.dart';
import 'package:bloodbond/common/widgets/common_app_bar.widget.dart';
import 'package:bloodbond/common/widgets/common_rounded_button.widget.dart';
import 'package:bloodbond/features/auth/bloc/forgot_password/forgot_password.bloc.dart';
import 'package:bloodbond/features/auth/widgets/login_text.widget.dart';
import 'package:bloodbond/features/auth/widgets/login_text_field.widget.dart';
import 'package:bloodbond/generated/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ForgotPasswordBloc(),
      child: const _ForgotPasswordView(),
    );
  }
}

class _ForgotPasswordView extends StatelessWidget {
  const _ForgotPasswordView();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ForgotPasswordBloc, ForgotPasswordState>(
      builder: (context, state) {
        // TODO: return correct widget based on the state.
        return Scaffold(
          appBar: const CommonAppBar(
            toolbarHeight: 40,
            hasBoxDecoration: false,
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.75,
                    child: Assets.icons.launcher.appIcon.image(
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const CustomText(
                  text: 'Forgot password ?',
                  fontSize: 22,
                ),
                const SizedBox(
                  height: 10,
                ),
                const CustomText(
                  text:
                      'Enter your email  for the verification process, we will send 4 digits code to your email ',
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
                const SizedBox(
                  height: 30,
                ),
                const CustomText(
                  text: 'Email',
                ),
                const CustomTextField(
                  hintText: 'Enter your Email',
                ),
                const SizedBox(
                  height: 105,
                ),
                SizedBox(
                  width: 250,
                  height: 45,
                  child: CommonRoundedButton(
                    onPressed: () {},
                    backgroundColor: const Color(0xFFFF2156),
                    content: 'Send',
                    textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.only(
                      bottom: context.paddingBottom > 0
                          ? context.paddingBottom
                          : 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
