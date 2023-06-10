import 'package:bloodbond/common/theme/app_size.dart';
import 'package:bloodbond/common/widgets/common_error.widget.dart';
import 'package:bloodbond/data/models/nft.model.dart';
import 'package:bloodbond/features/my_certificate/my_certificate.dart';
import 'package:bloodbond/features/my_certificate/widgets/certificate_item.widget.dart';
import 'package:flutter/cupertino.dart';

class CertificateList extends StatelessWidget {
  const CertificateList({
    super.key,
    required this.certificates,
    required this.status,
  });

  final List<NFTModel>? certificates;
  final MyCertificateStatus status;

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        if (status.isLoading || status.isInitial) {
          return const Center(
            child: Padding(
              padding: EdgeInsets.all(AppSize.horizontalSpace),
              child: CupertinoActivityIndicator(),
            ),
          );
        }
        if (certificates == null || certificates!.isEmpty) {
          return const CommonError(error: 'No certificate, please mint one');
        }
        if (status.isSuccess) {
          return ListView.separated(
            separatorBuilder: (context, index) => const SizedBox(
              height: 22,
            ),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: certificates!.length,
            itemBuilder: (context, index) {
              final certificate = certificates![index];
              return CertificateItem(certificate: certificate);
            },
          );
        } else {
          return const CommonError();
        }
      },
    );
  }
}
