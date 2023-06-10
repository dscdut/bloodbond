import 'package:bloodbond/common/theme/color_styles.dart';
import 'package:bloodbond/common/widgets/common_app_bar.widget.dart';
import 'package:bloodbond/features/my_certificate/widgets/certificate_card.dart';
import 'package:flutter/material.dart';

class MyCertificateView extends StatelessWidget {
  const MyCertificateView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE5E5E5),
      appBar: const CommonAppBar(
        title: 'My Certificate',
        backgroundColor: ColorStyles.backgroundAppbar,
      ),
      body: ListView(
        children: const [
          SizedBox(
            height: 30,
          ),
          CertificateCard(),
          CertificateCard(),
          CertificateCard(),
          CertificateCard(),
          CertificateCard(),
        ],
      ),
    );
  }
}
