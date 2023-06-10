import 'package:bloodbond/common/theme/app_size.dart';
import 'package:bloodbond/common/widgets/common_app_bar.widget.dart';
import 'package:bloodbond/data/repositories/nft.repository.dart';
import 'package:bloodbond/di/di.dart';
import 'package:bloodbond/features/my_certificate/widgets/certificate_list.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloodbond/features/my_certificate/my_certificate.dart';

class MyCertificatePage extends StatelessWidget {
  const MyCertificatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          MyCertificateBloc(nftRepository: getIt.get<NFTRepository>()),
      child: BlocListener<MyCertificateBloc, MyCertificateState>(
        listener: (context, state) {
          if (state.status == MyCertificateStatus.error) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.error ?? 'Error'),
              ),
            );
          }
        },
        child: const _MyCertificateView(),
      ),
    );
  }
}

class _MyCertificateView extends StatelessWidget {
  const _MyCertificateView();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyCertificateBloc, MyCertificateState>(
      builder: (context, state) {
        return Scaffold(
          appBar: const CommonAppBar(
            title: 'My Certificates',
            backgroundColor: Colors.transparent,
            hasBoxDecoration: false,
          ),
          body: RefreshIndicator(
            onRefresh: () async {
              context.read<MyCertificateBloc>().add(MyCertificateFetchEvent());
            },
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(AppSize.horizontalSpace),
              child: CertificateList(
                certificates: state.certificates,
                status: state.status,
              ),
            ),
          ),
        );
      },
    );
  }
}
