import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'root.event.dart';
part 'root.state.dart';

class RootBloc extends Bloc<RootEvent, RootState> {
  RootBloc() : super(const RootState()) {
    on<RootBottomTabChange>(_onBottomTabChanged);
  }

  void _onBottomTabChanged(
    RootBottomTabChange event,
    Emitter<RootState> emit,
  ) {
    if (event.newIndex == state.currentIndex) return;

    emit(state.copyWith(currentIndex: event.newIndex));
  }
}
