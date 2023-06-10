import 'package:bloodbond/data/datasources/map/place.datasource.dart';
import 'package:bloodbond/data/models/address/coordinate.model.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class PlaceRepository {
  PlaceRepository({required PlaceDataSource placeDataSource})
      : _dataSource = placeDataSource;
  final PlaceDataSource _dataSource;
  Future<Map<String, double>> getGeometry(String placeId) {
    return _dataSource.getGeometry(placeId);
  }

  Future<List<CoordinateModel>> getCoordinates() async {
    return await _dataSource.getCoordinates();
  }
}
