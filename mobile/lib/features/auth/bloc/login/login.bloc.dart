import 'package:bloc/bloc.dart';
import 'package:bloodbond/features/auth/bloc/auth/auth.bloc.dart';
import 'package:equatable/equatable.dart';

part 'login.event.dart';
part 'login.state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({required AuthBloc authBloc, required userRepository}) : super(LoginInitial()) {
    on<LoginSubmit>((event, emit) {});
  }
}
