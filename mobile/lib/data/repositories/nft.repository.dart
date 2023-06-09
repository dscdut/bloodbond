import 'package:bloodbond/data/datasources/nft/nft.datasource.dart';
import 'package:bloodbond/data/models/nft.model.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class NFTRepository {
  NFTRepository({
    required NFTDataSource dataSource,
  }) : _dataSource = dataSource;

  final NFTDataSource _dataSource;

  Future<List<NFTModel>> getNFTs() {
    return _dataSource.getNFTs();
  }
}
