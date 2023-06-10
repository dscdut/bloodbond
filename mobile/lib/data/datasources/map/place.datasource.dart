import 'package:bloodbond/common/constants/endpoints.dart';
import 'package:bloodbond/common/helpers/dio.helper.dart';
import 'package:bloodbond/data/models/address/coordinate.model.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class PlaceDataSource {
  PlaceDataSource({required DioHelper dioHelper}) : _dioHelper = dioHelper;
  final DioHelper _dioHelper;

  Future<Map<String, double>> getGeometry(String placeId) async {
    final HttpRequestResponse response = await _dioHelper.get(
      '${Endpoints.geoCode}&place_id=$placeId',
    );

    Map<String, dynamic> geoLocation =
        response.data['results'][0]['geometry']['location'];

    return {
      'lat': double.parse(
        (geoLocation['lat'] as double).toStringAsFixed(4),
      ),
      'lng': double.parse(
        (geoLocation['lng'] as double).toStringAsFixed(4),
      ),
    };
  }

  Future<List<CoordinateModel>> getCoordinates() async {
    return [];
  }
}
