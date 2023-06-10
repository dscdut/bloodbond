import 'package:bloodbond/data/models/address/campaign.model.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class CampaignDataSource {
  CampaignDataSource();

  Future<List<CampaignModel>> getCampaigns() async {
    return [
      CampaignModel(
        name: 'Blood',
        address: 'Blood',
        description: 'Blood',
        startDate: DateTime.now().subtract(const Duration(days: 2)),
        endDate: DateTime.now().add(const Duration(days: 2)),
      )
    ];
  }
}
