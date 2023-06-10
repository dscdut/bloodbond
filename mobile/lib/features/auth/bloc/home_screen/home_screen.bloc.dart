import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_screen.event.dart';
part 'home_screen.state.dart';

class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  HomeScreenBloc() : super(const HomeScreenState()) {
    on<HomeScreenEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
