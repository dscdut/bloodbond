import 'package:bloodbond/common/extensions/context.extension.dart';
import 'package:bloodbond/common/theme/color_styles.dart';
import 'package:bloodbond/common/theme/text_styles.dart';
import 'package:bloodbond/common/widgets/common_rounded_button.widget.dart';
import 'package:bloodbond/generated/assets.gen.dart';
import 'package:bloodbond/generated/locale_keys.g.dart';
import 'package:bloodbond/router/app_router.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

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
                    height: context.height * 0.63,
                    child: Assets.icons.launcher.appIcon.image(),
                  ),
                  SizedBox(
                    width: 250,
                    height: 45,
                    child: CommonRoundedButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(AppRouter.login);
                      },
                      backgroundColor: ColorStyles.primary,
                      content: LocaleKeys.auth_login.tr(),
                      textStyle: TextStyles.s17BoldText.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: 250,
                    height: 45,
                    child: CommonRoundedButton(
                      onPressed: () {},
                      backgroundColor: Colors.white,
                      borderSide: const BorderSide(
                        color: ColorStyles.primary,
                      ),
                      content: LocaleKeys.auth_register.tr(),
                      textStyle: TextStyles.s17BoldText.copyWith(
                        color: ColorStyles.primary,
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
