import 'package:bloodbond/features/my_certificate/my_certificate.dart';
import 'package:bloodbond/features/my_certificate/widgets/history_donate_item.widget.dart';
import 'package:flutter/material.dart';

class HistoryDonateList extends StatelessWidget {
  const HistoryDonateList(
      {super.key, required this.items, required this.itemCount,});

  final List<BloodItemModel> items;
  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => const SizedBox(
        height: 14,
      ),
      itemCount: itemCount,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return HistoryDonateItem(items: items, index: index);
      },
    );
  }
}
