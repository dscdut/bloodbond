import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'forgot_password.event.dart';
part 'forgot_password.state.dart';

class ForgotPasswordBloc
extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  ForgotPasswordBloc({required authBloc, required userRepository}) : super(const ForgotPasswordState()) {
    on<ForgotPasswordEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
