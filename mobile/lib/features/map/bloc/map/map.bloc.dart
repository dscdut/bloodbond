import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

part 'map.event.dart';
part 'map.state.dart';

class MapsBloc extends Bloc<MapsEvent, MapsState> {
  MapsBloc() : super(const MapsState.initial()) {
    on<MapsPermissionRequest>(_onMapsPermissionRequest);
    add(MapsPermissionRequest());
  }

  Future<void> _onMapsPermissionRequest(
    MapsPermissionRequest event,
    Emitter<MapsState> emit,
  ) async {
    try {
      final bool isLocationGranted = await Permission.location.isGranted;
      if (!isLocationGranted) {
        final PermissionStatus permissionStatus =
            await Permission.location.request();
        if (permissionStatus != PermissionStatus.granted) {
          emit(
            state.copyWith(
              error: 'Location permissions are denied',
            ),
          );
          return;
        }
      }
      final LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        final LocationPermission permission =
            await Geolocator.requestPermission();
        if (permission == LocationPermission.denied ||
            permission == LocationPermission.deniedForever) {
          emit(
            state.copyWith(
              error: 'Location permissions are denied',
            ),
          );
          return;
        }
      }
      final Position position = await Geolocator.getCurrentPosition();
      final LatLng myLocation = LatLng(
        position.latitude,
        position.longitude,
      );

      final Set<Marker> markers = {
        Marker(
          markerId: const MarkerId('myLocation'),
          position: LatLng(
            position.latitude,
            position.longitude,
          ),
          infoWindow: const InfoWindow(
            title: 'My Location',
          ),
        ),
      };
      emit(
        MapsGetLocationSuccess(myLocation: myLocation, markers: markers),
      );
    } catch (e) {
      log(e.toString());
      emit(
        state.copyWith(
          error: e.toString(),
        ),
      );
    }
  }
}
