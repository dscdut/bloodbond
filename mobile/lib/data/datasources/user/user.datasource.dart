import 'package:bloodbond/data/datasources/user/local/user.datasource.dart';
import 'package:bloodbond/data/datasources/user/remote/user.datasource.dart';
import 'package:bloodbond/data/dtos/auth/login_by_email_request.dto.dart';
import 'package:bloodbond/data/dtos/auth/login_response.dto.dart';
import 'package:bloodbond/data/models/user.model.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class UserDataSource {
  UserDataSource({
    required UserRemoteDataSource remoteDataSource,
    required UserLocalDataSource localDataSource,
  })  : _remoteDataSource = remoteDataSource,
        _localDataSource = localDataSource;

  final UserRemoteDataSource _remoteDataSource;
  final UserLocalDataSource _localDataSource;

  Future<UserModel> loginByEmail(LoginByEmailRequestDTO params) async {
    final LoginResponseDTO loginResponse =
        await _remoteDataSource.loginByEmail(params);

    await _localDataSource.setUserAuth(loginResponse);

    return loginResponse.user;
  }

  UserModel? getUserInfo() {
    return _localDataSource.getUserInfo();
  }
}
