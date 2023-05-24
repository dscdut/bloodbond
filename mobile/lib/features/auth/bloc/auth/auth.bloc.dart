import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:bloodbond/data/models/user.model.dart';
import 'package:bloodbond/data/repositories/user.repository.dart';

part 'auth.event.dart';
part 'auth.state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({required UserRepository userRepository})
      : _userRepository = userRepository,
        super(const AuthState.unknown()) {
    on<AuthUserInfoSet>(_onSetUserInfo);
    on<AuthUserInfoCheck>(_onCheckUserInfo);
  }
  final UserRepository _userRepository;

  void _onCheckUserInfo(
    AuthUserInfoCheck event,
    Emitter<AuthState> emit,
  ) {
    try {
      final UserModel? user = _userRepository.getUserInfo();

      _changeAuthState(user, emit);
    } catch (err) {
      emit(const AuthState.unauthenticated());
    }
  }

  void _onSetUserInfo(AuthUserInfoSet event, Emitter<AuthState> emit) {
    _changeAuthState(event.currentUser, emit);
  }

  void _changeAuthState(UserModel? user, Emitter<AuthState> emit) {
    if (user == null) {
      emit(const AuthState.unauthenticated());
    } else {
      emit(AuthState.authenticated(user));
    }
  }
}
