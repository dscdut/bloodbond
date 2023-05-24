import 'dart:convert';

import 'package:bloodbond/common/constants/hive_keys.dart';
import 'package:bloodbond/data/dtos/auth/login_response.dto.dart';
import 'package:bloodbond/data/models/user.model.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class UserLocalDataSource {
  UserLocalDataSource({
    @Named(HiveKeys.authBox) required Box authBox,
  }) : _authBox = authBox;

  final Box _authBox;

  UserModel? getUserInfo() {
    final String? rawData = _authBox.get(HiveKeys.user);

    if (rawData == null) {
      return null;
    } else {
      return UserModel.fromJson(Map<String, dynamic>.from(jsonDecode(rawData)));
    }
  }

  Future<void> setUserInfo(UserModel user) async {
    await _authBox.put(HiveKeys.user, jsonEncode(user));
  }

  Future<void> setUserAuth(LoginResponseDTO? response) async {
    if (response == null) {
      await _authBox.clear();
    } else {
      await _authBox.putAll({
        ...response.toRefreshTokenDTO().toLocalJson(),
        HiveKeys.user: jsonEncode(response.user),
      });
    }
  }
}
