import 'dart:async';

import 'package:bloodbond/common/constants/constants.dart';
import 'package:bloodbond/common/extensions/context.extension.dart';
import 'package:bloodbond/common/utils/toast.util.dart';
import 'package:bloodbond/data/repositories/campaign.repository.dart';
import 'package:bloodbond/data/repositories/place.repository.dart';
import 'package:bloodbond/di/di.dart';
import 'package:bloodbond/features/map/map.dart';
import 'package:bloodbond/features/map/widgets/map_app_bar.widget.dart';
import 'package:bloodbond/features/map/widgets/map_bottom_sheet.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatelessWidget {
  MapPage({super.key});
  final Completer<GoogleMapController> controller = Completer();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MapBloc(
            placeRepository: getIt.get<PlaceRepository>(),
          ),
        ),
        BlocProvider(
          create: (context) => MapBottomsheetBloc(
            campaignRepository: getIt.get<CampaignRepository>(),
          ),
        )
      ],
      child: BlocListener<MapBloc, MapState>(
        listener: (context, state) => _listenMapStateChanged(context, state),
        child: _MapView(
          controller: controller,
        ),
      ),
    );
  }

  Future<void> _listenMapStateChanged(
    BuildContext context,
    MapState state,
  ) async {
    if (state is MapGetLocationSuccess) {
      GoogleMapController googleMapController = await controller.future;
      googleMapController.animateCamera(
        CameraUpdate.newLatLngZoom(
          state.myLocation ?? defaultLocation,
          12,
        ),
      );
    }
    if (state.error != null && context.mounted) {
      ToastUtil.showError(context, text: state.error);
    }
  }
}

class _MapView extends StatefulWidget {
  const _MapView({
    required this.controller,
  });
  final Completer<GoogleMapController> controller;

  @override
  State<_MapView> createState() => _MapViewState();
}

class _MapViewState extends State<_MapView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MapAppBar(),
      extendBodyBehindAppBar: true,
      body: BlocBuilder<MapBloc, MapState>(
        builder: (context, state) {
          return SizedBox(
            height: context.height,
            width: context.width,
            child: GoogleMap(
              initialCameraPosition: const CameraPosition(
                target: defaultLocation,
                zoom: 5,
              ),
              onMapCreated: (gController) {
                widget.controller.complete(gController);
              },
              mapToolbarEnabled: false,
              zoomControlsEnabled: false,
              buildingsEnabled: false,
              markers: state.markers
                      ?.map(
                        (e) => Marker(
                          markerId: e.markerId,
                          position: e.position,
                          onTap: () {
                            _onClickMarker(context, e.position);
                          },
                        ),
                      )
                      .toSet() ??
                  const {},
            ),
          );
        },
      ),
    );
  }

  void _onClickMarker(BuildContext context, LatLng wardLocation) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      isScrollControlled: true,
      builder: (ccontext) {
        return BlocProvider.value(
          value: context.read<MapBottomsheetBloc>()
            ..add(MapBottomSheetGetCampaigns(wardLocation: wardLocation)),
          child: const CampaignBottomSheet(),
        );
      },
    );
  }
}
