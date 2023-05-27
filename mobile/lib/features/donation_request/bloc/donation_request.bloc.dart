import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'donation_request.event.dart';
part 'donation_request.state.dart';
part 'donation_request.bloc.freezed.dart';

class DonationRequestBloc
    extends Bloc<DonationRequestEvent, DonationRequestState> {
  DonationRequestBloc() : super(const DonationRequestState.initial()) {
    on<DonationRequestEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
