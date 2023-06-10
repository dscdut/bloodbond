import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:bloodbond/common/constants/constants.dart';
import 'package:bloodbond/data/repositories/place.repository.dart';
import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:geolocator/geolocator.dart';

part 'map.state.dart';
part 'map.event.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  MapBloc({
    required PlaceRepository placeRepository,
  })  : _placeRepository = placeRepository,
        super(
          const MapState.initial(),
        ) {
    on<MapPermissionRequest>(_onRequestPermission);
    on<MapMarkersGet>(_onGetMarkers);
    add(MapPermissionRequest());
    add(const MapMarkersGet());
  }
  final PlaceRepository _placeRepository;

  Future<LatLng> _getMyLocation(Emitter<MapState> emiiter) async {
    try {
      final Position userPosition = await Geolocator.getCurrentPosition();

      return LatLng(userPosition.latitude, userPosition.longitude);
    } catch (err) {
      log('Error in get user location');
      emiiter(
        state.copyWith(
          error: err.toString(),
        ),
      );

      return defaultLocation;
    }
  }

  Future<void> _onRequestPermission(
    MapPermissionRequest event,
    Emitter<MapState> emiiter,
  ) async {
    final bool isGranted = await Permission.location.isGranted;

    if (!isGranted) {
      await Permission.location.request();
    }

    emiiter(
      MapGetLocationSuccess(
        myLocation: await _getMyLocation(emiiter),
        markers: state.markers ?? const {},
      ),
    );
  }

  Future<void> _onGetMarkers(
    MapMarkersGet event,
    Emitter<MapState> emiiter,
  ) async {
    try {
      final response = await _getMyLocation(emiiter);
      emiiter(
        state.copyWith(
          markers: {
            Marker(
              markerId: const MarkerId('myLocation'),
              position: response,
            ),
          },
        ),
      );
    } catch (e) {
      log('Error in get markers');
      emiiter(
        state.copyWith(
          error: e.toString(),
        ),
      );
    }
  }
}
