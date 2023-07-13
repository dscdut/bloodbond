import 'package:bloodbond/common/extensions/context.extension.dart';
import 'package:bloodbond/features/auth/widgets/login_footer.widget.dart';
import 'package:bloodbond/features/auth/widgets/login_form.widget.dart';
import 'package:bloodbond/features/auth/widgets/login_header.widget.dart';
import 'package:bloodbond/features/auth/widgets/login_other_method.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloodbond/features/auth/bloc/login/login.bloc.dart';
import 'package:bloodbond/common/widgets/common_app_bar.widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({key}) : super(key: key);

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
      appBar: CommonAppBar(
        toolbarHeight: kToolbarHeight + context.paddingTop - 60,
        hasBoxDecoration: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Remove 'const' keyword from here
            const LoginHeader(),
            const LoginForm(),
            const LoginOtherMethod(),
            const LoginFooter(),
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
