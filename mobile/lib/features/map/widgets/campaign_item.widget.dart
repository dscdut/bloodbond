import 'package:bloodbond/common/extensions/context.extension.dart';
import 'package:bloodbond/common/theme/color_styles.dart';
import 'package:bloodbond/common/theme/text_styles.dart';
import 'package:bloodbond/data/models/address/campaign.model.dart';
import 'package:bloodbond/generated/assets.gen.dart';
import 'package:flutter/material.dart';

class CampaignItem extends StatelessWidget {
  const CampaignItem({
    super.key,
    required this.currentCampaign,
  });
  final CampaignModel currentCampaign;

  final double height = 65;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      behavior: HitTestBehavior.opaque,
      child: Container(
        width: context.width,
        height: height,
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(
                height,
              ),
              child: currentCampaign.image == null
                  ? Assets.images.campaign.image(
                      height: height,
                      width: height,
                      fit: BoxFit.cover,
                    )
                  : Image.network(
                      currentCampaign.image!,
                      width: height,
                      height: height,
                      fit: BoxFit.cover,
                    ),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Flexible(
                        child: Text(
                          currentCampaign.name,
                          style: TextStyles.s14MediumText,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Container(
                        width: 8,
                        height: 1.6,
                        margin: const EdgeInsets.symmetric(
                          horizontal: 5,
                        ),
                        color: ColorStyles.gray400,
                      ),
                      Text(
                        currentCampaign.statusContent,
                        style: TextStyles.s14MediumText.copyWith(
                          color: currentCampaign.isOngoing
                              ? ColorStyles.green400
                              : ColorStyles.red400,
                        ),
                      )
                    ],
                  ),
                  Text(
                    currentCampaign.organizationName ?? '',
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
