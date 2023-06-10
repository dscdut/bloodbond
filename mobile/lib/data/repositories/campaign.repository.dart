import 'package:bloodbond/data/datasources/map/campaign.datasource.dart';
import 'package:bloodbond/data/models/address/campaign.model.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class CampaignRepository {
  CampaignRepository({required CampaignDataSource dataSource})
      : _dataSource = dataSource;
  final CampaignDataSource _dataSource;

  Future<List<CampaignModel>> getCampaigns() {
    return _dataSource.getCampaigns();
  }
}
