part of 'login.bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState({
    this.error,
  });

  final String? error;

  @override
  List<Object?> get props => [error];
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginNotSuccess extends LoginState {
  const LoginNotSuccess({required super.error});
}
