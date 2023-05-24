part of 'root.bloc.dart';

abstract class RootEvent extends Equatable {
  const RootEvent();

  @override
  List<Object> get props => [];
}

class RootBottomTabChange extends RootEvent {
  const RootBottomTabChange({required this.newIndex});

  final int newIndex;

  @override
  List<Object> get props => [newIndex];
}
