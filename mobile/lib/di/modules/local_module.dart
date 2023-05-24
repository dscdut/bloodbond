import 'package:bloodbond/common/constants/hive_keys.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

@module
abstract class LocalModule {
  @Named(HiveKeys.authBox)
  @singleton
  @preResolve
  Future<Box> get authBox => Hive.openBox(HiveKeys.authBox);

  /// If you have any local module/ hive box / shared_preferences / flutter_secure_storage
  /// Please provide here
}
