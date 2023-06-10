import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'my_information.event.dart';
part 'my_information.state.dart';

class MyInformationBloc extends Bloc<MyInformationEvent, MyInformationState> {
  MyInformationBloc() : super(const MyInformationState()) {
    on<MyInformationEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
