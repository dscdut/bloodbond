import 'dart:async';
import 'dart:developer';

import 'package:bloodbond/common/constants/blood_enum.dart';
import 'package:bloodbond/common/constants/constants.dart';
import 'package:bloodbond/common/extensions/context.extension.dart';
import 'package:bloodbond/common/utils/toast.util.dart';
import 'package:bloodbond/data/repositories/donor.repository.dart';
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

  late BloodType bloodType;

  late double distance;

  void _setBloodType(BloodType bloodType) {
    this.bloodType = bloodType;
    setState(() {});
  }

  void _setDistance(double distance) {
    this.distance = distance;
    setState(() {});
  }

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
          create: (context) =>
              MapsBloc(donorRepository: getIt.get<DonorRepository>()),
        ),
        BlocProvider(
          create: (context) => MapBottomsheetBloc(
            donorRepository: getIt.get<DonorRepository>(),
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
          bloodType: bloodType,
          distance: distance,
          setBloodType: _setBloodType,
          setDistance: _setDistance,
        ),
      ),
    );
  }

  Future<void> _listenMapStateChanged(
    BuildContext context,
    MapsState state,
  ) async {
    if (state is MapsGetLocationSuccess) {
      // GoogleMapController googleMapController1 = await controller.future;
      // log('state.myLocation: ${state.myLocation}');
      // log('defaultLocation: $defaultLocation');
      // googleMapController1.animateCamera(
      //   CameraUpdate.newLatLngZoom(
      //     state.myLocation ?? defaultLocation,
      //     7,
      //   ),
      // );
    }
    if (state is MapsGetDonorsSuccess) {
      // GoogleMapController googleMapController2 = await controller.future;
      // googleMapController2.animateCamera(
      //   CameraUpdate.newLatLngZoom(
      //     state.myLocation ?? defaultLocation,
      //     11,
      //   ),
      // );

      _setBloodType(state.bloodType ?? BloodType.aMinus);

      _setDistance(state.distance ?? 5);
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
    _setBloodType(BloodType.aMinus);
    _setDistance(0);
  }
}

class _MapView extends StatelessWidget {
  const _MapView({
    required this.controller,
    required this.destination,
    required this.polylineCoordinates,
    required this.getPolyPoints,
    required this.setDestination,
    required this.bloodType,
    required this.distance,
    required this.setBloodType,
    required this.setDistance,
  });
  final Completer<GoogleMapController> controller;
  final LatLng destination;
  final List<LatLng> polylineCoordinates;
  final Function(MapsState state, List<LatLng> polylineCoordinates)
      getPolyPoints;
  final Function(LatLng destination) setDestination;
  final Function(BloodType bloodType) setBloodType;
  final Function(double distance) setDistance;

  final BloodType bloodType;

  final double distance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MapAppBar(
        onFindTap: () {
          _onFindTap(context);
        },
        setBloodType: setBloodType,
        setDistance: setDistance,
      ),
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
                top: context.height * 2,
              ),
              initialCameraPosition: const CameraPosition(
                target: defaultLocation,
                zoom: 12,
              ),
              onMapCreated: (gController) {
                controller.complete(gController);
              },
              buildingsEnabled: false,
              myLocationEnabled: true,
              mapToolbarEnabled: false,
              circles: {
                Circle(
                  circleId: const CircleId('myLocation'),
                  center: state.myLocation ?? defaultLocation,
                  radius: (5) * 1000,
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

  void _onFindTap(BuildContext context) {
    context.read<MapsBloc>().add(
          MapsGetDonors(
            bloodType: bloodType,
            distance: distance,
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
