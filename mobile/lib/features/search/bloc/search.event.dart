part of 'search.bloc.dart';

@freezed
class SearchEvent with _$SearchEvent {
  const factory SearchEvent.started() = _Started;
}
