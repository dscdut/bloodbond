import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloodbond/features/find_donors/find_donors.dart';

class FindDonorsPage extends StatelessWidget {
  const FindDonorsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => FindDonorsBloc(),
      child: const _FindDonorsView(),
    );
  }
}

class _FindDonorsView extends StatelessWidget {
  const _FindDonorsView();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FindDonorsBloc, FindDonorsState>(
      builder: (context, state) {
        // TODO: return correct widget based on the state.
        return const SizedBox();
      },
    );
  }
}
