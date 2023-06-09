import 'package:bloodbond/common/extensions/context.extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloodbond/features/auth/auth.dart';
import 'package:bloodbond/generated/assets.gen.dart';

class ConnectRecoveryPage extends StatelessWidget {
  const ConnectRecoveryPage({super.key});

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
    return BlocBuilder<ConnectRecoveryBloc, ConnectRecoveryState>(
      builder: (context, state) {
        // TODO: return correct widget based on the state.
        return Scaffold(
          body: Stack(
            children: [
              Positioned.fill(
                child: Assets.images.decoration.splashBackground
                    .svg(fit: BoxFit.fill),
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
                        height: 203,
                        child: Assets.icons.launcher.appIcon.image(),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const Text(
                        'Enter Your Secret Recovery Pharse',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
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
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(
                          left: 41,
                          right: 41,
                        ),
                        child: SizedBox(
                          height: 140,
                          child: TextField(
                            keyboardType: TextInputType.multiline,
                            maxLines: 3,
                            textAlignVertical: TextAlignVertical.top,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF7C7C7C),
                            ),
                            cursorColor: Color(0xFFFF2156),
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(
                                top: 30,
                                bottom: 30,
                                left: 15,
                                right: 15,
                              ),
                              fillColor: Colors.white,
                              filled: true,
                              hintText:
                                  'push me and then just touch me till i can get my satisfaction',
                              hintStyle: TextStyle(
                                fontSize: 21,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF7C7C7C),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(15),
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(15),
                                ),
                                borderSide: BorderSide(
                                  color: Colors.white,
                                  width: 2,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(15),
                                ),
                                borderSide: BorderSide(
                                  color: Colors.white,
                                  width: 2,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 73,
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
                              // Navigator.of(context).pushNamed(AppRouter.recovery);
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
      },
    );
  }
}
