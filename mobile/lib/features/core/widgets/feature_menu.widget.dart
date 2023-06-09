import 'package:bloodbond/common/theme/app_shadow.dart';
import 'package:bloodbond/common/theme/app_size.dart';
import 'package:bloodbond/common/theme/color_styles.dart';
import 'package:bloodbond/common/theme/text_styles.dart';
import 'package:bloodbond/generated/assets.gen.dart';
import 'package:bloodbond/router/app_router.dart';
import 'package:flutter/material.dart';

class FeatureUIModel {
  FeatureUIModel({required this.icon, required this.title, this.route});

  final SvgGenImage icon;
  final String title;
  final String? route;
}

class FeatureMenu extends StatefulWidget {
  const FeatureMenu({super.key});

  @override
  State<FeatureMenu> createState() => _FeatureMenuState();
}

class _FeatureMenuState extends State<FeatureMenu> {
  final List<FeatureUIModel> _features = [
    FeatureUIModel(icon: Assets.icons.featureMenu.search, title: 'Find Donors'),
    FeatureUIModel(icon: Assets.icons.featureMenu.donate, title: 'Donates'),
    FeatureUIModel(icon: Assets.icons.featureMenu.order, title: 'Order Bloods'),
    FeatureUIModel(
      icon: Assets.icons.featureMenu.assistant,
      title: 'Assistant',
    ),
    FeatureUIModel(
      icon: Assets.icons.featureMenu.report,
      title: 'Report',
      route: AppRouter.report,
    ),
    FeatureUIModel(icon: Assets.icons.featureMenu.campaign, title: 'Campaign'),
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: AppSize.horizontalSpace,
        mainAxisSpacing: AppSize.horizontalSpace,
      ),
      itemBuilder: (context, index) {
        final item = _features[index];

        return GestureDetector(
          onTap: () {
            if (item.route != null) {
              Navigator.of(context).pushNamed(item.route!);
            }
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: AppShadow.primaryShadow,
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                item.icon.svg(),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  item.title,
                  style: TextStyles.s14MediumText
                      .copyWith(color: ColorStyles.gray),
                )
              ],
            ),
          ),
        );
      },
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: _features.length,
    );
  }
}
