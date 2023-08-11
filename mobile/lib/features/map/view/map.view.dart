import 'dart:async';

import 'package:bloodbond/common/constants/constants.dart';
import 'package:bloodbond/common/extensions/context.extension.dart';
import 'package:bloodbond/common/utils/toast.util.dart';
import 'package:bloodbond/data/repositories/campaign.repository.dart';
import 'package:bloodbond/di/di.dart';
import 'package:bloodbond/features/map/map.dart';
import 'package:bloodbond/features/map/widgets/map_app_bar.widget.dart';
import 'package:bloodbond/features/map/widgets/map_bottom_sheet.widget.dart';
import 'package:bloodbond/flavors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final Completer<GoogleMapController> controller = Completer();

  late LatLng destination;

  late List<LatLng> polylineCoordinates = [];

  void _setDestination(LatLng destination) {
    this.destination = destination;
    setState(() {});
  }

  void _getPolyPoints(MapsState state, List<LatLng> polylineCoordinates) async {
    PolylinePoints polylinePoints = PolylinePoints();

    this.polylineCoordinates = polylineCoordinates;
    setState(() {});
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      AppFlavor.googleMapApiKey,
      PointLatLng(state.myLocation!.latitude, state.myLocation!.longitude),
      PointLatLng(destination.latitude, destination.longitude),
    );

    this.polylineCoordinates = polylineCoordinates;
    setState(() {});

    if (result.points.isNotEmpty) {
      polylineCoordinates = [];
      for (var point in result.points) {
        polylineCoordinates.add(
          LatLng(point.latitude, point.longitude),
        );

        this.polylineCoordinates = polylineCoordinates;
        setState(() {});
      }
    }
    this.polylineCoordinates = polylineCoordinates;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MapsBloc(),
        ),
        BlocProvider(
          create: (context) => MapBottomsheetBloc(
            campaignRepository: getIt.get<CampaignRepository>(),
          ),
        )
      ],
      child: BlocListener<MapsBloc, MapsState>(
        listener: (context, state) => _listenMapStateChanged(context, state),
        child: _MapView(
          controller: controller,
          destination: destination,
          polylineCoordinates: polylineCoordinates,
          getPolyPoints: _getPolyPoints,
          setDestination: _setDestination,
        ),
      ),
    );
  }

  Future<void> _listenMapStateChanged(
    BuildContext context,
    MapsState state,
  ) async {
    if (state is MapsGetLocationSuccess) {
      GoogleMapController googleMapController = await controller.future;
      googleMapController.animateCamera(
        CameraUpdate.newLatLngZoom(
          state.myLocation ?? defaultLocation,
          13,
        ),
      );
    }
    if (state.error != null && context.mounted) {
      ToastUtil.showError(context, text: state.error);
    }
  }

  @override
  void initState() {
    super.initState();
    _getPolyPoints(const MapsState.initial(), polylineCoordinates);
    _setDestination(defaultLocation);
  }
}

class _MapView extends StatefulWidget {
  const _MapView({
    required this.controller,
    required this.destination,
    required this.polylineCoordinates,
    required this.getPolyPoints,
    required this.setDestination,
  });
  final Completer<GoogleMapController> controller;
  final LatLng destination;
  final List<LatLng> polylineCoordinates;
  final Function(MapsState state, List<LatLng> polylineCoordinates)
      getPolyPoints;
  final Function(LatLng destination) setDestination;

  @override
  State<_MapView> createState() => _MapViewState();
}

class _MapViewState extends State<_MapView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MapAppBar(),
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: true,
      body: BlocBuilder<MapsBloc, MapsState>(
        buildWhen: (previous, current) => previous != current,
        builder: (context, state) {
          return SizedBox(
            height: context.height,
            width: context.width,
            child: GoogleMap(
              padding: EdgeInsets.only(
                bottom: context.height * 0.15,
                top: context.height * 0.15,
              ),
              initialCameraPosition: const CameraPosition(
                target: defaultLocation,
                zoom: 5,
              ),
              onMapCreated: (gController) {
                widget.controller.complete(gController);
              },
              buildingsEnabled: false,
              myLocationEnabled: true,
              circles: {
                Circle(
                  circleId: const CircleId('myLocation'),
                  center: state.myLocation ?? defaultLocation,
                  radius: 5000,
                  fillColor: const Color(0xFFFF2156).withOpacity(0.1),
                  strokeColor: Colors.transparent,
                  strokeWidth: 0,
                ),
              },
              // polylines: {
              //   Polyline(
              //     polylineId: const PolylineId('route'),
              //     color: Colors.red,
              //     width: 5,
              //     points: widget.polylineCoordinates,
              //   ),
              // },
              //add my location to list of markers
              markers: state.markers
                      ?.map(
                        (e) => Marker(
                          icon: e.icon,
                          markerId: e.markerId,
                          position: e.position,
                          onTap: () {
                            _onClickMarker(context, e.position);
                          },
                        ),
                      )
                      .toSet() ??
                  {},
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
