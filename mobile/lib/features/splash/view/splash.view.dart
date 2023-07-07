import 'package:bloodbond/common/extensions/context.extension.dart';
import 'package:bloodbond/generated/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloodbond/features/auth/bloc/auth/auth.bloc.dart';
import 'package:bloodbond/features/splash/bloc/splash.bloc.dart';

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
          Assets.images.decoration.splashBackground
              .image(width: double.infinity, fit: BoxFit.cover),
          Column(
            children: [
              const Spacer(),
              const SizedBox(
                height: 15,
              ),
              Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 550,
                    child: Assets.icons.launcher.appIcon.image(),
                  ),
                  SizedBox(
                    width: 250,
                    height: 45,
                    child: ElevatedButton(
                      onPressed: () {
                        // Navigator.of(context)
                        //     .pushNamed(AppRouter.connectWallet);
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        backgroundColor: const Color(0xFFFF2156),
                      ),
                      child: const Text(
                        'Login',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: 250,
                    height: 45,
                    child: ElevatedButton(
                      onPressed: () {
                        // Navigator.of(context).pushNamed(AppRouter.root);
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                          side: const BorderSide(
                            color: Color(0xFFFF2156),
                          ),
                        ),
                        backgroundColor: Colors.white,
                      ),
                      child: const Text(
                        'Register',
                        style: TextStyle(
                          color: Color(0xFFFF2156),
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const Spacer(
                flex: 2,
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
