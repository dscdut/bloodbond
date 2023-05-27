part of 'report.bloc.dart';

@freezed
class ReportEvent with _$ReportEvent {
  const factory ReportEvent.started() = _Started;
}
