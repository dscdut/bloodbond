import 'package:bloodbond/common/constants/endpoints.dart';
import 'package:bloodbond/common/helpers/dio.helper.dart';
import 'package:bloodbond/data/dtos/auth/login_by_email_request.dto.dart';
import 'package:bloodbond/data/dtos/auth/login_response.dto.dart';
import 'package:bloodbond/data/models/user.model.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class UserRemoteDataSource {
  UserRemoteDataSource({required DioHelper dioHelper}) : _dioHelper = dioHelper;

  final DioHelper _dioHelper;

  Future<LoginResponseDTO> loginByEmail(LoginByEmailRequestDTO params) async {
    final HttpRequestResponse response = await _dioHelper.post(
      Endpoints.login,
      data: params.toJson(),
    );

    return LoginResponseDTO(
      user: UserModel.fromJson(response.data['data']['user']),
      refreshToken: response.data['data']['token']['refreshToken'],
      accessToken: response.data['data']['token']['accessToken'],
      expiresIn: response.data['data']['token']['expiresIn'],
    );
  }
}
