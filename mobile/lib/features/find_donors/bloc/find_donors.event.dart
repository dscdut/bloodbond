part of 'find_donors.bloc.dart';

@freezed
class FindDonorsEvent with _$FindDonorsEvent {
  const factory FindDonorsEvent.started() = _Started;
}
