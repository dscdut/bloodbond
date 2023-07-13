import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:bloodbond/data/dtos/auth/login_by_email_request.dto.dart';
import 'package:bloodbond/data/models/user.model.dart';
import 'package:bloodbond/data/repositories/user.repository.dart';
import 'package:bloodbond/generated/locale_keys.g.dart';
import 'package:bloodbond/features/auth/bloc/auth/auth.bloc.dart';

part 'login.event.dart';
part 'login.state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({
    required UserRepository userRepository,
    required AuthBloc authBloc,
  })  : _authBloc = authBloc,
        _userRepository = userRepository,
        super(LoginInitial()) {
    on<LoginSubmit>(_onLoginSubmit);
  }

  final AuthBloc _authBloc;
  final UserRepository _userRepository;

  Future<void> _onLoginSubmit(
    LoginSubmit event,
    Emitter<LoginState> emit,
  ) async {
    emit(LoginLoading());

    try {
      final UserModel user = await _userRepository.loginByEmail(
        LoginByEmailRequestDTO(
          email: event.email,
          password: event.password,
        ),
      );

      _authBloc.add(AuthUserInfoSet(currentUser: user));
    } catch (err) {
      bool isUnauthorizedError =
          err is DioError && err.response?.statusCode == 401;

      emit(
        LoginNotSuccess(
          error: isUnauthorizedError
              ? LocaleKeys.validator_incorrect_email_password.tr()
              : null,
        ),
      );
    }
  }
}
