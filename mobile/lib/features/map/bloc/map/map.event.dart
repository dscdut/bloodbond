part of 'map.bloc.dart';

abstract class MapsEvent extends Equatable {
  const MapsEvent();

  @override
  List<Object?> get props => [];
}

class MapsPermissionRequest extends MapsEvent {}

class MapsGetDirection extends MapsEvent {
  const MapsGetDirection({
    required this.origin,
    required this.destination,
  });

  final Polyline origin;
  final Polyline destination;

  @override
  List<Object?> get props => [origin, destination];
}

class MapsGetDonors extends MapsEvent {
  const MapsGetDonors({required this.bloodType, required this.distance});
  final BloodType bloodType;
  final double distance;

  @override
  List<Object?> get props => [bloodType, distance];
}
