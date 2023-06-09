import 'package:bloodbond/flavors.dart';

abstract class Endpoints {
  static String apiUrlv1 = '${AppFlavor.apiBaseUrl}/sol/v1';

  static String login = '$apiUrlv1/auth/login';
  static String userInfo = '$apiUrlv1/auth/me';

  static String nft = '$apiUrlv1/nft';
}
