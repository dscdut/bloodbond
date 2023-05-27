import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'find_donors.event.dart';
part 'find_donors.state.dart';
part 'find_donors.bloc.freezed.dart';

class FindDonorsBloc extends Bloc<FindDonorsEvent, FindDonorsState> {
  FindDonorsBloc() : super(const FindDonorsState.initial()) {
    on<FindDonorsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
