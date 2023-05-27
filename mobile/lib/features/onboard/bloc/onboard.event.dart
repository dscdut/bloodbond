part of 'onboard.bloc.dart';

@freezed
class OnboardEvent with _$OnboardEvent {
  const factory OnboardEvent.started() = _Started;
}
