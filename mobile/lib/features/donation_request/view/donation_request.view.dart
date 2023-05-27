import 'package:bloodbond/common/widgets/common_app_bar.widget.dart';
import 'package:bloodbond/features/donation_request/donation_request.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DonationRequestPage extends StatelessWidget {
  const DonationRequestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => DonationRequestBloc(),
      child: const _DonationRequestView(),
    );
  }
}

class _DonationRequestView extends StatelessWidget {
  const _DonationRequestView();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CommonAppBar(
        title: 'Donation request',
      ),
      body: SizedBox(),
    );
  }
}
