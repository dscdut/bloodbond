part of 'donation_request.bloc.dart';

@freezed
class DonationRequestEvent with _$DonationRequestEvent {
  const factory DonationRequestEvent.started() = _Started;
}
