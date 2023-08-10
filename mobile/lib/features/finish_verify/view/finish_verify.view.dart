import 'package:bloodbond/common/extensions/context.extension.dart';
import 'package:bloodbond/common/theme/color_styles.dart';
import 'package:bloodbond/common/theme/text_styles.dart';
import 'package:bloodbond/common/widgets/common_app_bar.widget.dart';
import 'package:bloodbond/common/widgets/common_rounded_button.widget.dart';
import 'package:bloodbond/generated/assets.gen.dart';
import 'package:bloodbond/generated/locale_keys.g.dart';
import 'package:bloodbond/router/app_router.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloodbond/features/finish_verify/finish_verify.dart';

class FinishVerifyPage extends StatelessWidget {
  const FinishVerifyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => FinishVerifyBloc(
        authBloc: context.read(),
        userRepository: context.read(),
      ),
      child: const _FinishVerifyView(),
    );
  }
}

class _FinishVerifyView extends StatelessWidget {
  const _FinishVerifyView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        toolbarHeight: kToolbarHeight + context.paddingTop - 60,
        hasBoxDecoration: false,
      ),
      body: Align(
        child: Column(
          children: [
            const Spacer(),
            const SizedBox(height: 80),
            SizedBox(
              child: Assets.images.decoration.success.image(),
            ),
            const SizedBox(height: 120),
            SizedBox(
              width: 250,
              height: 45,
              child: SizedBox(
                width: 250,
                height: 45,
                child: CommonRoundedButton(
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      AppRouter.root,
                      (route) => false,
                    );
                  },
                  backgroundColor: ColorStyles.primary,
                  content: LocaleKeys.button_send.tr(),
                  textStyle: TextStyles.s17BoldText.copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}
