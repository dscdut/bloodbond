import 'package:bloodbond/data/datasources/map/donor.datasource.dart';
import 'package:bloodbond/data/models/donor.model.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class DonorRepository {
  DonorRepository(this._donorDataSource);

  final DonorDataSource _donorDataSource;

  Future<List<DonorModel>> getDonors() async {
    return _donorDataSource.getDonors();
  }
}
