import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'onboard.event.dart';
part 'onboard.state.dart';
part 'onboard.bloc.freezed.dart';

class OnboardBloc extends Bloc<OnboardEvent, OnboardState> {
  OnboardBloc() : super(const OnboardState.initial()) {
    on<OnboardEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
