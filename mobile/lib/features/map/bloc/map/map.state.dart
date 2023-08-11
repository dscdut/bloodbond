part of 'map.bloc.dart';

class MapsState extends Equatable {
  const MapsState.initial()
      : this(
          myLocation: defaultLocation,
          markers: const {},
          polylines: const {},
        );
  const MapsState({
    this.myLocation,
    this.markers,
    this.polylines,
    this.error,
  });

  final LatLng? myLocation;
  final Set<Marker>? markers;
  final Set<Polyline>? polylines;
  final String? error;

  MapsState copyWith({
    LatLng? myLocation,
    Set<Marker>? markers,
    Set<Polyline>? polylines,
    String? error,
  }) {
    return MapsState(
      myLocation: myLocation ?? this.myLocation,
      markers: markers ?? this.markers,
      polylines: polylines ?? this.polylines,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [
        myLocation,
        markers,
        polylines,
        error,
      ];
}

class MapsGetLocationSuccess extends MapsState {
  const MapsGetLocationSuccess({
    required LatLng myLocation,
    required Set<Marker> markers,
  }) : super(myLocation: myLocation, markers: markers);
}
