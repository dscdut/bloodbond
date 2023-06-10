import 'package:bloodbond/common/extensions/context.extension.dart';
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
            child:
                Assets.images.decoration.splashBackground.svg(fit: BoxFit.fill),
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
                    'Enter Your Secret Recovery Phrase',
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
                    child: CommonTextFormField(
                      keyboardType: TextInputType.multiline,
                      maxLines: 3,
                      textAlignVertical: TextAlignVertical.top,
                      hint:
                          'push me and then just touch me till i can get my satisfaction',
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
  }
}

class CommonTextFormField extends StatelessWidget {
  const CommonTextFormField({
    super.key,
    required this.keyboardType,
    required this.maxLines,
    required this.textAlignVertical,
    required this.hint,
  });
  final TextInputType keyboardType;
  final int maxLines;
  final TextAlignVertical textAlignVertical;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      child: TextField(
        keyboardType: keyboardType,
        maxLines: maxLines,
        textAlignVertical: textAlignVertical,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w400,
          color: Color(0xFF7C7C7C),
        ),
        cursorColor: const Color(0xFFFF2156),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(
            top: 30,
            bottom: 30,
            left: 15,
            right: 15,
          ),
          fillColor: Colors.white,
          filled: true,
          hintText: hint,
          hintStyle: const TextStyle(
            fontSize: 21,
            fontWeight: FontWeight.w400,
            color: Color(0xFF7C7C7C),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
              color: Colors.white,
              width: 2,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
              color: Colors.white,
              width: 2,
            ),
          ),
        ),
      ),
    );
  }
}
