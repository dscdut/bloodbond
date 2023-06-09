import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'connect_recovery.event.dart';
part 'connect_recovery.state.dart';

class ConnectRecoveryBloc
    extends Bloc<ConnectRecoveryEvent, ConnectRecoveryState> {
  ConnectRecoveryBloc() : super(const ConnectRecoveryState()) {
    on<ConnectRecoveryEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
