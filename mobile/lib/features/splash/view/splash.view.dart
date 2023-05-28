import 'package:bloodbond/common/extensions/context.extension.dart';
import 'package:bloodbond/flavors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloodbond/common/theme/text_styles.dart';
import 'package:bloodbond/generated/assets.gen.dart';
import 'package:bloodbond/features/auth/bloc/auth/auth.bloc.dart';
import 'package:bloodbond/features/splash/bloc/splash.bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SplashBloc(
        authBloc: context.read<AuthBloc>(),
      ),
      lazy: false,
      child: const _SplashView(),
    );
  }
}

class _SplashView extends StatelessWidget {
  const _SplashView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child:
                Assets.images.decoration.splashBackground.svg(fit: BoxFit.fill),
          ),
          Column(
            children: [
              const Spacer(),
              Column(
                children: [
                  Assets.icons.launcher.appIcon.image(),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    AppFlavor.title,
                    style: TextStyles.boldText
                        .copyWith(color: Colors.white, fontSize: 24),
                  )
                ],
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.only(
                      bottom: context.paddingBottom > 0
                          ? context.paddingBottom
                          : 20,
                    ),
                    child: Text(
                      'Powered by GDSC-DUT',
                      style: TextStyles.boldText
                          .copyWith(color: Colors.white, fontSize: 16.sp),
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
