import 'package:bloodbond/features/my_certificate/my_certificate.dart';
import 'package:bloodbond/features/my_certificate/widgets/blood_info_item.widget.dart';
import 'package:flutter/material.dart';

class BloodInfoList extends StatelessWidget {
  const BloodInfoList({super.key, required this.item, required this.itemCount});

  final List<BloodItemModel> item;
  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 16,
      ),
      itemCount: itemCount,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return BloodInfoItem(items: item, index: index);
      },
    );
  }
}
