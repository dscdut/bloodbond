import 'package:bloodbond/common/constants/handle_status.enum.dart';
import 'package:bloodbond/common/theme/text_styles.dart';
import 'package:bloodbond/common/utils/conditional_render.util.dart';
import 'package:bloodbond/common/widgets/bottom_sheet_header.widget.dart';
import 'package:bloodbond/features/map/map.dart';
import 'package:bloodbond/features/map/widgets/list_marker_campaigns.widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CampaignBottomSheet extends StatelessWidget {
  const CampaignBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.4,
      minChildSize: 0,
      maxChildSize: 0.8,
      expand: false,
      builder: (context, scrollController) {
        return CustomScrollView(
          physics: const ClampingScrollPhysics(),
          controller: scrollController,
          slivers: [
            SliverFillRemaining(
              fillOverscroll: true,
              child: Column(
                children: [
                  const BottomSheetHeader(),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: BlocBuilder<MapBottomsheetBloc, MapBottomSheetState>(
                      builder: (context, state) {
                        return ConditionalRenderUtil.single(
                          context,
                          value: state.status,
                          caseBuilders: {
                            HandleStatus.loading: (_) => const Center(
                                  child: CupertinoActivityIndicator(),
                                ),
                            HandleStatus.error: (_) => Center(
                                  child: Text(
                                    state.error!,
                                    style: TextStyles.s17RegularText,
                                  ),
                                ),
                            HandleStatus.success: (_) {
                              return ListMarkerCampaigns(
                                campaigns: state.campaigns,
                              );
                            }
                          },
                          fallbackBuilder: (_) => const SizedBox(),
                        );
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        );
      },
    );
  }
}
