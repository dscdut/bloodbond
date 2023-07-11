import 'package:bloodbond/common/widgets/common_app_bar.widget.dart';
import 'package:bloodbond/generated/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloodbond/features/finish_verify/finish_verify.dart';

class FinishVerifyPage extends StatelessWidget {
  const FinishVerifyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => FinishVerifyBloc(),
      child: const _FinishVerifyView(),
    );
  }
}

class _FinishVerifyView extends StatelessWidget {
  const _FinishVerifyView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(
        toolbarHeight: 40,
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
              width: MediaQuery.of(context).size.width * 0.6,
              height: 45,
              child: ElevatedButton(
                onPressed: () {
                  // Navigator.of(context).pushNamed(AppRouter.finish);
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  backgroundColor: const Color(0xFFFF2744),
                ),
                child: const Text(
                  'Finish',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
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
