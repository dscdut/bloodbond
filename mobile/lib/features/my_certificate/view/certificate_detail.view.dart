import 'package:bloodbond/common/theme/app_size.dart';
import 'package:bloodbond/common/theme/color_styles.dart';
import 'package:bloodbond/common/theme/text_styles.dart';
import 'package:bloodbond/common/widgets/common_app_bar.widget.dart';
import 'package:bloodbond/data/models/nft.model.dart';
import 'package:bloodbond/features/my_certificate/widgets/blood_info_list.widget.dart';
import 'package:bloodbond/features/my_certificate/widgets/history_donate_list.widget.dart';
import 'package:flutter/material.dart';

class BloodItemModel {
  BloodItemModel({required this.title, required this.content});

  final String title;
  final String content;
}

class CertificateDetail extends StatefulWidget {
  const CertificateDetail({super.key, required this.certificate});

  final NFTModel certificate;

  @override
  State<CertificateDetail> createState() => _CertificateDetailState();
}

class _CertificateDetailState extends State<CertificateDetail> {
  late NFTModel _certificate;
  final List<BloodItemModel> _items = [];

  @override
  void initState() {
    _certificate = widget.certificate;
    _items.addAll([
      BloodItemModel(
        title: 'Capacity',
        content: '${_certificate.attributes?.first?.capacity} cc',
      ),
      BloodItemModel(
        title: 'Blood type',
        content: _certificate.attributes?.first?.bloodType ?? 'Unknown',
      ),
      BloodItemModel(
        title: 'Bilirubin',
        content: '${_certificate.attributes?.first?.bilirubin} mmol/L',
      ),
      BloodItemModel(
        title: 'RBC',
        content: '${_certificate.attributes?.first?.rbc} ml/L',
      ),
      BloodItemModel(
        title: 'Name',
        content: _certificate.name ?? 'Unknown',
      ),
      BloodItemModel(
        title: 'Owner',
        content: _certificate.properties?.creators?.first?.address ?? 'Unknown',
      ),
      BloodItemModel(
        title: 'Update authority',
        content: _certificate.properties?.creators?.first?.address ?? 'Unknown',
      ),
    ]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: Text(widget.certificate.name ?? 'Unknown'),
        hasBoxDecoration: false,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSize.horizontalSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return InteractiveViewer(
                        child: Image.network(widget.certificate.image ?? ''),
                      );
                    },
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: ColorStyles.red300.withOpacity(0.2),
                        blurRadius: 20,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      widget.certificate.image ?? '',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            AppSize.h28,
            Text(
              'Blood information',
              style: TextStyles.boldText.copyWith(
                color: ColorStyles.gray,
                fontSize: 16,
              ),
            ),
            AppSize.h12,
            BloodInfoList(item: _items, itemCount: 4),
            AppSize.h12,
            Text(
              'History donation',
              style: TextStyles.boldText.copyWith(
                color: ColorStyles.gray,
                fontSize: 16,
              ),
            ),
            AppSize.h12,
            HistoryDonateList(items: _items, itemCount: 3),
            const SizedBox(height: 14),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 15,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: ColorStyles.red300,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Description',
                    style: TextStyles.s17BoldText.copyWith(
                      color: ColorStyles.gray,
                    ),
                  ),
                  const SizedBox(height: 14),
                  Text(
                    _certificate.description ?? 'Unknown',
                    style: TextStyles.s17MediumText.copyWith(
                      color: ColorStyles.gray,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
