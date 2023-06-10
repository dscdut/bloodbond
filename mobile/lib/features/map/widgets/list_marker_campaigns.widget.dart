import 'package:bloodbond/data/models/address/campaign.model.dart';
import 'package:bloodbond/features/map/widgets/campaign_item.widget.dart';
import 'package:flutter/material.dart';

class ListMarkerCampaigns extends StatelessWidget {
  const ListMarkerCampaigns({
    super.key,
    required this.campaigns,
  });
  final List<CampaignModel> campaigns;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final CampaignModel currentCampaign = campaigns[index];

        return CampaignItem(currentCampaign: currentCampaign);
      },
      separatorBuilder: (context, index) => const Divider(),
      itemCount: campaigns.length,
    );
  }
}
