import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'report.event.dart';
part 'report.state.dart';
part 'report.bloc.freezed.dart';

class ReportBloc extends Bloc<ReportEvent, ReportState> {
  ReportBloc() : super(const ReportState.initial()) {
    on<ReportEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
