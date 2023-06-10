import 'package:bloodbond/flavors.dart';

abstract class Endpoints {
  static String apiUrlv1 = '${AppFlavor.apiBaseUrl}/sol/v1';

  static String login = '$apiUrlv1/auth/login';
  static String userInfo = '$apiUrlv1/auth/me';

  static String nft = '$apiUrlv1/nft';

  static String geoCode =
      'https://maps.googleapis.com/maps/api/geocode/json?key=${AppFlavor.googleMapApiKey}';
}
