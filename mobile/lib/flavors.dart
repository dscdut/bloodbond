import 'package:bloodbond/common/constants/env_keys.dart';

enum Flavor {
  DEV,
  QA,
  STAGING,
}

class AppFlavor {
  static Flavor? appFlavor;

  static String get apiBaseUrl => const String.fromEnvironment(EnvKeys.baseURL);

  static String get apiKey => const String.fromEnvironment(EnvKeys.apiKey);

  static String get network => const String.fromEnvironment(EnvKeys.network);

  static String get googleMapApiKey =>
      const String.fromEnvironment(EnvKeys.googleMapsApiKey);

  static String get nftAddress =>
      const String.fromEnvironment(EnvKeys.nftAddress);

  static String get title {
    switch (appFlavor) {
      case Flavor.DEV:
        return 'BloodBond DEV';
      case Flavor.QA:
        return 'BloodBond QA';
      case Flavor.STAGING:
        return 'BloodBond';
      default:
        return 'title';
    }
  }
}
