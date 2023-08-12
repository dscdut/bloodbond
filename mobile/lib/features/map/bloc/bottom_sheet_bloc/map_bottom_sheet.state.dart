part of 'map_bottom_sheet.bloc.dart';

class MapBottomSheetState extends Equatable {
  const MapBottomSheetState._({
    this.status = HandleStatus.initial,
    this.error,
    this.campaigns = const [],
    this.donors = const [],
  });

  const MapBottomSheetState.initial() : this._(status: HandleStatus.initial);

  const MapBottomSheetState.loading() : this._(status: HandleStatus.loading);

  const MapBottomSheetState.success({
    required List<DonorModel> donors,
  }) : this._(status: HandleStatus.success, donors: donors);

  const MapBottomSheetState.error({
    required String error,
  }) : this._(
          status: HandleStatus.error,
          error: error,
        );

  final HandleStatus status;
  final List<CampaignModel> campaigns;
  final String? error;
  final List<DonorModel> donors;

  @override
  List<Object?> get props => [status, error];
}
