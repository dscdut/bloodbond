import 'package:bloc/bloc.dart';
import 'package:bloodbond/common/constants/handle_status.enum.dart';
import 'package:bloodbond/data/models/address/campaign.model.dart';
import 'package:bloodbond/data/repositories/campaign.repository.dart';
import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'map_bottom_sheet.event.dart';
part 'map_bottom_sheet.state.dart';

class MapBottomsheetBloc
    extends Bloc<MapBottomSheetEvent, MapBottomSheetState> {
  MapBottomsheetBloc({required CampaignRepository campaignRepository})
      : _campaignRepository = campaignRepository,
        super(const MapBottomSheetState.initial()) {
    on<MapBottomSheetGetCampaigns>(_onGetCampaigns);
  }
  final CampaignRepository _campaignRepository;

  Future<void> _onGetCampaigns(
    MapBottomSheetGetCampaigns event,
    Emitter<MapBottomSheetState> emit,
  ) async {
    emit(
      const MapBottomSheetState.loading(),
    );

    try {
      final List<CampaignModel> campaigns =
          await _campaignRepository.getCampaigns();

      emit(MapBottomSheetState.success(campaigns: campaigns));
    } catch (err) {
      emit(
        MapBottomSheetState.error(
          error: err.toString(),
        ),
      );
    }
  }
}
