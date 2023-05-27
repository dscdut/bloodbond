import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:bloodbond/features/auth/bloc/auth/auth.bloc.dart';

part 'splash.event.dart';
part 'splash.state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc({required AuthBloc authBloc})
      : _authBloc = authBloc,
        super(const SplashState()) {
    on<SplashStarted>(_onSplashStarted);
    add(SplashStarted());
  }

  final AuthBloc _authBloc;

  Future<void> _onSplashStarted(
    SplashStarted event,
    Emitter<SplashState> emit,
  ) async {
    await Future.delayed(const Duration(milliseconds: 600));

    _authBloc.add(AuthUserInfoCheck());
  }
}
