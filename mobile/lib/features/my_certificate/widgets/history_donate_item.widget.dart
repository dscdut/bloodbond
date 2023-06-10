import 'package:bloodbond/common/theme/color_styles.dart';
import 'package:bloodbond/common/theme/text_styles.dart';
import 'package:bloodbond/features/my_certificate/my_certificate.dart';
import 'package:flutter/material.dart';

class HistoryDonateItem extends StatelessWidget {
  const HistoryDonateItem({
    super.key,
    required this.items,
    required this.index,
  });

  final List<BloodItemModel> items;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: Row(
        children: [
          Text(
            items[index + 4].title,
            style: TextStyles.s17BoldText.copyWith(
              color: ColorStyles.gray,
            ),
          ),
          const Spacer(),
          Expanded(
            child: Text(
              items[index + 4].content,
              style: TextStyles.s17BoldText.copyWith(
                color: ColorStyles.gray,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.end,
            ),
          ),
          if (items[index + 4].content.length > 20)
            Text(
              items[index + 4].content.length > 20
                  ? items[index + 4].content.substring(
                        items[index + 4].content.length - 8,
                        items[index + 4].content.length,
                      )
                  : '',
              style: TextStyles.s17BoldText.copyWith(
                color: ColorStyles.gray,
              ),
              maxLines: 1,
              textAlign: TextAlign.start,
            ),
        ],
      ),
    );
  }
}
