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

class MapBottomSheetGetDonors extends MapBottomSheetEvent {
  const MapBottomSheetGetDonors({required this.bloodType});
  final BloodType bloodType;

  @override
  List<Object?> get props => [bloodType];
}
