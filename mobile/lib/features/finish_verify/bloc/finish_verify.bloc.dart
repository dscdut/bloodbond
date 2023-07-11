import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'finish_verify.event.dart';
part 'finish_verify.state.dart';

class FinishVerifyBloc extends Bloc<FinishVerifyEvent, FinishVerifyState> {
  FinishVerifyBloc() : super(const FinishVerifyState()) {
    on<FinishVerifyEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
