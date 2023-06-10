import 'package:bloodbond/common/theme/app_size.dart';
import 'package:bloodbond/common/theme/color_styles.dart';
import 'package:bloodbond/common/widgets/common_app_bar.widget.dart';
import 'package:bloodbond/features/core/widgets/feature_menu.widget.dart';
import 'package:bloodbond/features/home/widgets/campagin_advertising_slider.widget.dart';
import 'package:bloodbond/features/home/widgets/home_appbar.widget.dart';
import 'package:bloodbond/generated/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloodbond/features/home/bloc/home.bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeBloc(),
      child: const _HomeView(),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: HomeAppBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(AppSize.horizontalSpace),
        child: Column(
          children: [
            CampaignAdvertisingSlider(),
            FeatureMenu(),
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
