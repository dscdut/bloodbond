import 'dart:developer';
import 'dart:typed_data';
import 'package:bloodbond/generated/assets.gen.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:ui' as ui;
import 'package:bloc/bloc.dart';
import 'package:bloodbond/common/constants/constants.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

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
      // final bool isLocationGranted = await Permission.location.isGranted;
      // if (!isLocationGranted) {
      //   final PermissionStatus permissionStatus =
      //       await Permission.location.request();
      //   if (permissionStatus != PermissionStatus.granted) {
      //     emit(
      //       state.copyWith(
      //         error: permissionStatus.name.toLowerCase(),
      //       ),
      //     );
      //     return;
      //   }
      // }
      final LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        final LocationPermission permission =
            await Geolocator.requestPermission();
        if (permission == LocationPermission.denied ||
            permission == LocationPermission.deniedForever) {
          emit(
            state.copyWith(
              error:
                  '${permission.name.toUpperCase()}, open app settings to enable location permission.',
            ),
          );
          return;
        }
      }
      final Position position = await Geolocator.getCurrentPosition();
      log('eeeeeeeeeeeeeeeeeeeeeeeeeeeeeee${position.toString()}');
      final LatLng myLocation = LatLng(
        position.latitude,
        position.longitude,
      );

      final Uint8List customMarker = await getBytesFromAsset(
        path: Assets.icons.maps.icMyLocationPng.path, //paste the custom image path
        width: 100, // size of custom image as marker
      );

      final Set<Marker> markers = {
        Marker(
          icon: BitmapDescriptor.fromBytes(customMarker),
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

Future<Uint8List> getBytesFromAsset({
  required String path,
  required int width,
}) async {
  ByteData data = await rootBundle.load(path);
  ui.Codec codec = await ui.instantiateImageCodec(
    data.buffer.asUint8List(),
    targetWidth: width,
  );
  ui.FrameInfo fi = await codec.getNextFrame();
  return (await fi.image.toByteData(
    format: ui.ImageByteFormat.png,
  ))!
      .buffer
      .asUint8List();
}
