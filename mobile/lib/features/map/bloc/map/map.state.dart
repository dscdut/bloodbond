part of 'map.bloc.dart';

class MapsState extends Equatable {
  const MapsState.initial()
      : this(
          myLocation: defaultLocation,
          markers: const {},
          polylines: const {},
          donors: const [],
        );
  const MapsState({
    this.myLocation,
    this.markers,
    this.polylines,
    this.error,
    this.donors,
    this.distance,
    this.bloodType,
  });

  final LatLng? myLocation;
  final Set<Marker>? markers;
  final Set<Polyline>? polylines;
  final String? error;
  final List<DonorModel>? donors;
  final double? distance;
  final BloodType? bloodType;

  MapsState copyWith({
    LatLng? myLocation,
    Set<Marker>? markers,
    Set<Polyline>? polylines,
    String? error,
    List<DonorModel>? donors,
  }) {
    return MapsState(
      myLocation: myLocation ?? this.myLocation,
      markers: markers ?? this.markers,
      polylines: polylines ?? this.polylines,
      error: error ?? this.error,
      donors: donors ?? this.donors,
    );
  }

  @override
  List<Object?> get props => [
        myLocation,
        markers,
        polylines,
        error,
        donors,
      ];
}

class MapsGetLocationSuccess extends MapsState {
  const MapsGetLocationSuccess({
    required LatLng myLocation,
    required Set<Marker> markers,
  }) : super(myLocation: myLocation, markers: markers);
}

class MapsGetDonorsSuccess extends MapsState {
  const MapsGetDonorsSuccess({
    required LatLng myLocation,
    required Set<Marker> markers,
    required List<DonorModel> donors,
    required double distance,
    required BloodType bloodType,
  }) : super(
          myLocation: myLocation,
          markers: markers,
          donors: donors,
          distance: distance,
          bloodType: bloodType,
        );
}
