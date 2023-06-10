part of 'map_bottom_sheet.bloc.dart';

abstract class MapBottomSheetEvent extends Equatable {
  const MapBottomSheetEvent();

  @override
  List<Object?> get props => [];
}

class MapBottomSheetGetCampaigns extends MapBottomSheetEvent {
  const MapBottomSheetGetCampaigns({required this.wardLocation});
  final LatLng wardLocation;

  @override
  List<Object?> get props => [wardLocation];
}
