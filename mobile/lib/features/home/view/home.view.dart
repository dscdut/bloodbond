import 'package:bloodbond/common/theme/app_size.dart';
import 'package:bloodbond/features/core/widgets/feature_menu.widget.dart';
import 'package:bloodbond/features/find_donors/widgets/campaign_card.dart';
import 'package:bloodbond/features/home/widgets/campagin_advertising_slider.widget.dart';
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
    return Scaffold(
      // appBar: const HomeAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppSize.horizontalSpace),
          child: Column(
            children: const [
              CampaignAdvertisingSlider(),
              FeatureMenu(),
              CampaignCard(),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
