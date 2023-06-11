import 'package:bloodbond/common/extensions/context.extension.dart';
import 'package:bloodbond/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloodbond/features/auth/auth.dart';
import 'package:bloodbond/generated/assets.gen.dart';

class ConnectWalletPage extends StatelessWidget {
  const ConnectWalletPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ConnectRecoveryBloc(),
      child: const _ConnectRecoveryView(),
    );
  }
}

class _ConnectRecoveryView extends StatelessWidget {
  const _ConnectRecoveryView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Assets.images.decoration.splashBackground
                .image(fit: BoxFit.fill),
          ),
          Column(
            children: [
              const Spacer(),
              const SizedBox(
                height: 50,
              ),
              Column(
                children: [
                  SizedBox(
                    height: 340,
                    child: Assets.icons.launcher.appIcon.image(
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(
                      left: 45,
                      right: 45,
                    ),
                    child: Text(
                      'Please enter your secret recovery phrase below. This phrase is composed of random generated 12 words.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF515151),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color:
                                Colors.black.withOpacity(0.25), // shadow color
                          ),
                          const BoxShadow(
                            offset: Offset(0, 4),
                            blurRadius: 6,
                            color: Colors.white, // background color
                          ),
                        ],
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: TextField(
                        style: const TextStyle(
                          fontSize: 20.0,
                          color: Colors.black54,
                        ),
                        maxLines: 5,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(12.0),
                          hintStyle: const TextStyle(color: Colors.black54),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 40,
                      right: 40,
                    ),
                    child: SizedBox(
                      width: double.infinity,
                      height: 60,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed(AppRouter.root);
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          backgroundColor: const Color(0xFFFFFFFF),
                        ),
                        child: const Text(
                          'Next',
                          style: TextStyle(
                            color: Color(0xFFFF2156),
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                          ),
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
