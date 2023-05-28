import 'package:bloodbond/common/constants/env_keys.dart';

enum Flavor {
  DEV,
  QA,
  STAGING,
}

class AppFlavor {
  static Flavor? appFlavor;

  static String get apiBaseUrl => const String.fromEnvironment(EnvKeys.baseURL);

  static String get title {
    switch (appFlavor) {
      case Flavor.DEV:
        return 'BloodChain DEV';
      case Flavor.QA:
        return 'BloodChain QA';
      case Flavor.STAGING:
        return 'BloodChain';
      default:
        return 'title';
    }
  }
}
