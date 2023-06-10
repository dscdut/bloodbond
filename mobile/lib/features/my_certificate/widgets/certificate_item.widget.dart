import 'package:bloodbond/common/theme/app_size.dart';
import 'package:bloodbond/common/theme/text_styles.dart';
import 'package:bloodbond/common/widgets/blood_type.widget.dart';
import 'package:bloodbond/data/models/nft.model.dart';
import 'package:bloodbond/router/app_router.dart';
import 'package:flutter/material.dart';

class CertificateItem extends StatelessWidget {
  const CertificateItem({super.key, required this.certificate});

  final NFTModel certificate;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(
          AppRouter.certificateDetail,
          arguments: certificate,
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 30,
            ),
          ],
          image: DecorationImage(
            image: NetworkImage(certificate.image),
            fit: BoxFit.cover,
            opacity: 0.04,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  certificate.attributes.first.timestamp,
                  style: TextStyles.mediumText.copyWith(
                    color: Colors.grey,
                  ),
                ),
                AppSize.h8,
                Text(
                  certificate.attributes.first.operationName,
                  style: TextStyles.boldText.copyWith(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
                AppSize.h8,
                Text(
                  'Amount: ${certificate.attributes.first.capacity}cc',
                  style: TextStyles.mediumText.copyWith(color: Colors.grey),
                ),
                AppSize.h8,
                Text(
                  'Location: ${certificate.attributes.first.organizationName}',
                  style: TextStyles.mediumText.copyWith(color: Colors.grey),
                ),
              ],
            ),
            const Spacer(),
            BloodTypeWidget(
              bloodType: certificate.attributes.first.bloodType,
            ),
          ],
        ),
      ),
    );
  }
}
