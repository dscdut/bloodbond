import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloodbond/features/onboard/onboard.dart';

class OnboardPage extends StatelessWidget {
  const OnboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => OnboardBloc(),
      child: const _OnboardView(),
    );
  }
}

class _OnboardView extends StatelessWidget {
  const _OnboardView();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardBloc, OnboardState>(
      builder: (context, state) {
        // TODO: return correct widget based on the state.
        return const SizedBox();
      },
    );
  }
}
