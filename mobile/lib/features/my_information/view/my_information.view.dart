import 'package:bloodbond/common/theme/app_size.dart';
import 'package:bloodbond/common/widgets/common_app_bar.widget.dart';
import 'package:bloodbond/features/my_information/widgets/avatar_blood_name.widget.dart';
import 'package:bloodbond/features/my_information/widgets/information_list.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloodbond/features/my_information/my_information.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyInformationPage extends StatelessWidget {
  const MyInformationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MyInformationBloc(),
      child: const _MyInformationView(),
    );
  }
}

class _MyInformationView extends StatelessWidget {
  const _MyInformationView();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyInformationBloc, MyInformationState>(
      builder: (context, state) {
        return Scaffold(
          appBar: const CommonAppBar(
            title: 'My Information',
            backgroundColor: Colors.transparent,
            hasBoxDecoration: false,
          ),
          body: SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(
              AppSize.horizontalSpace,
              50.h,
              AppSize.horizontalSpace,
              150.h,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                AvatarBloodName(),
                AppSize.h28,
                InformationList(),
              ],
            ),
          ),
        );
      },
    );
  }
}
