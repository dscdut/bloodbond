import 'package:bloodbond/common/widgets/common_app_bar.widget.dart';
import 'package:bloodbond/features/my_information/widgets/certificates_box.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloodbond/features/my_information/my_information.dart';

class AntiNFTCertificates extends StatelessWidget {
  const AntiNFTCertificates({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MyInformationBloc(),
      child: const _AntiNFTCertificates(),
    );
  }
}

class _AntiNFTCertificates extends StatelessWidget {
  const _AntiNFTCertificates();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyInformationBloc, MyInformationState>(
      builder: (context, state) {
        return Scaffold(
          appBar: const CommonAppBar(
            title: 'My Certificates',
            backgroundColor: Colors.transparent,
            hasBoxDecoration: false,
          ),
          body: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            children: const [
              SizedBox(
                height: 49,
              ),
              CertificateBox(
                date: 'June 4th 2021, 07:30',
                campaignName: 'Hoa Khanh Hospital',
                bloodbag: '300cc',
                place: 'Hoa Khanh Hospital',
              ),
              SizedBox(
                height: 20,
              ),
              CertificateBox(
                date: 'October 20th 2021, 08:30',
                campaignName: 'Giot mau cho em',
                bloodbag: '300cc',
                place: 'Hoa Khanh Hospital',
              ),
              SizedBox(
                height: 20,
              ),
              CertificateBox(
                date: 'April 13th 2022, 14:00',
                campaignName: 'Trao giot mau hong',
                bloodbag: '300cc',
                place: 'Vinmec',
              ),
              SizedBox(
                height: 20,
              ),
              CertificateBox(
                date: 'October 26th 2022, 8:00',
                campaignName: 'Bach Khoa Da Nang',
                bloodbag: '300cc',
                place: 'Hoa Khanh Hospital',
              ),
              SizedBox(
                height: 20,
              ),
              CertificateBox(
                date: 'July 18th 2023, 8:00',
                campaignName: 'Giot mau do tuoi',
                bloodbag: '300cc',
                place: 'Hoa Khanh Hospital',
              ),
            ],
          ),
        );
      },
    );
  }
}
