import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'welcome_page.event.dart';
part 'welcome_page.state.dart';

class WelcomePageBloc extends Bloc<WelcomePageEvent, WelcomePageState> {
  WelcomePageBloc() : super(const WelcomePageState()) {
    on<WelcomePageEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
