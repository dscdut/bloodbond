part of 'root.bloc.dart';

class RootState extends Equatable {
  const RootState({
    this.currentIndex = 0,
  });

  final int currentIndex;

  @override
  List<Object> get props => [currentIndex];

  RootState copyWith({
    int? currentIndex,
  }) {
    return RootState(
      currentIndex: currentIndex ?? this.currentIndex,
    );
  }
}
