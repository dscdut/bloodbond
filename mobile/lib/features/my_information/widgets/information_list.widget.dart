import 'package:bloodbond/common/theme/app_size.dart';
import 'package:bloodbond/features/my_information/widgets/information_item.widget.dart';
import 'package:bloodbond/generated/assets.gen.dart';
import 'package:bloodbond/router/app_router.dart';
import 'package:flutter/material.dart';

class InformationList extends StatelessWidget {
  const InformationList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppSize.h12,
        InformationItem(
          icon: Assets.icons.profile.certificate,
          title: 'My Certificates',
          route: AppRouter.myCertificate,
        ),
        AppSize.h12,
        InformationItem(
          icon: Assets.icons.profile.bloodReport,
          title: 'Blood Report',
        ),
        AppSize.h12,
        InformationItem(
          icon: Assets.icons.profile.testForm,
          title: 'Test Form',
        ),
      ],
    );
  }
}
