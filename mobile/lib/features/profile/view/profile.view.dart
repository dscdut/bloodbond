import 'package:bloodbond/common/theme/app_size.dart';
import 'package:bloodbond/common/widgets/common_app_bar.widget.dart';
import 'package:bloodbond/features/profile/widgets/avatar_name_location.widget.dart';
import 'package:bloodbond/features/profile/widgets/setting_list.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloodbond/features/profile/bloc/profile.bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProfileBloc(),
      child: const _ProfileView(),
    );
  }
}

class _ProfileView extends StatelessWidget {
  const _ProfileView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(
        title: 'Profile',
        hasBoxDecoration: false,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(
          AppSize.horizontalSpace,
          AppSize.horizontalSpace,
          AppSize.horizontalSpace,
          150.h,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            AvatarNameLocation(),
            SizedBox(
              height: 30,
            ),
            SettingList()
          ],
        ),
      ),
    );
  }
}
