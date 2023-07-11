import 'package:bloodbond/common/extensions/context.extension.dart';
import 'package:bloodbond/common/widgets/common_rounded_button.widget.dart';
import 'package:bloodbond/features/auth/widgets/login_text.widget.dart';
import 'package:bloodbond/features/auth/widgets/login_text_field.widget.dart';
import 'package:bloodbond/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloodbond/features/auth/bloc/login/login.bloc.dart';
import 'package:bloodbond/common/widgets/common_app_bar.widget.dart';
import 'package:bloodbond/generated/assets.gen.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginBloc(
        authBloc: context.read(),
        userRepository: context.read(),
      ),
      child: const _LoginView(),
    );
  }
}

class _LoginView extends StatelessWidget {
  const _LoginView();

  @override
  Widget build(BuildContext context) {
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
                width: MediaQuery.of(context).size.width * 0.6,
                child: Assets.icons.launcher.appIcon.image(
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const CustomText(
              text: 'Login',
              fontSize: 23,
            ),
            const SizedBox(
              height: 10,
            ),
            const CustomText(
              text: 'Login to continue using the app',
              fontSize: 15,
              fontWeight: FontWeight.w400,
            ),
            const SizedBox(
              height: 40,
            ),
            const CustomText(
              text: 'Email',
            ),
            const CustomTextField(
              hintText: 'Enter your Email',
            ),
            const CustomText(
              text: 'Password',
            ),
            const CustomTextField(
              hintText: 'Enter your password',
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 250,
              height: 45,
              child: CommonRoundedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(AppRouter.finish);
                },
                backgroundColor: const Color(0xFFFF2156),
                content: 'Login',
                textStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
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
              child: const Padding(
                padding: EdgeInsets.only(),
                child: Text(
                  'Forgot password?',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFFFF2744),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(
                      left: 20,
                      right: 10,
                    ),
                    child: const Divider(
                      color: Color(0xFF000000),
                      height: 36,
                      thickness: 1,
                    ),
                  ),
                ),
                const Text(
                  'Or login with',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF000000),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(
                      left: 10,
                      right: 20,
                    ),
                    child: const Divider(
                      color: Color(0xFF000000),
                      height: 36,
                      thickness: 1,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 40),
                  child: IconButton(
                    onPressed: () {
                      // Action on pressed
                    },
                    iconSize: 55,
                    icon: Assets.icons.launcher.facebookIcon.svg(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(),
                  child: IconButton(
                    onPressed: () {
                      // Action on pressed
                    },
                    iconSize: 55,
                    icon: Assets.icons.launcher.googleIcon.svg(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40),
                  child: IconButton(
                    onPressed: () {
                      // Action on pressed
                    },
                    iconSize: 55,
                    icon: Assets.icons.launcher.appleIcon.svg(),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: const Padding(
                    padding: EdgeInsets.only(),
                    child: Text(
                      "Don't have an account?",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF000000), // Màu đen
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    print('Register');
                  },
                  child: const Padding(
                    padding: EdgeInsets.only(left: 4),
                    child: Text(
                      'Register',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFFFF2744), // Màu đỏ
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(
                  bottom:
                      context.paddingBottom > 0 ? context.paddingBottom : 15,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
