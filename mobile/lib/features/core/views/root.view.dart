import 'package:bloodbond/common/theme/color_styles.dart';
import 'package:bloodbond/features/core/widgets/app_bottom_navigation_bar.widget.dart';
import 'package:bloodbond/features/find_donors/find_donors.dart';
import 'package:bloodbond/generated/assets.gen.dart';
import 'package:bloodbond/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloodbond/features/core/bloc/root.bloc.dart';
import 'package:bloodbond/features/core/widgets/custom_lazy_indexed_stack.widget.dart';
import 'package:bloodbond/features/home/home.dart';
import 'package:bloodbond/features/notification/notification.dart';
import 'package:bloodbond/features/profile/profile.dart';

class RootPage extends StatelessWidget {
  const RootPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => RootBloc(),
      child: const _RootView(),
    );
  }
}

class _RootView extends StatelessWidget {
  const _RootView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<RootBloc, RootState>(
        builder: (
          context,
          state,
        ) {
          return SlideIndexedStack(
            index: state.currentIndex,
            children: const [
              HomePage(),
              FindDonorsPage(),
              NotificationPage(),
              NotificationPage(),
              ProfilePage(),
            ],
          );
        },
        buildWhen: (previous, current) {
          return previous.currentIndex != current.currentIndex;
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).pushNamed(
          AppRouter.createRequest,
        ),
        elevation: 1,
        backgroundColor: Colors.white,
        child: Container(
          width: double.infinity,
          height: double.infinity,
          margin: const EdgeInsets.all(6),
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: ColorStyles.primary,
          ),
          child: Assets.icons.bottomNavigation.blood.svg(),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const AppBottomNavigationBar(),
      extendBody: true,
    );
  }
}
