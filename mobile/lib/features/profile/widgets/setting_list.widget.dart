import 'package:bloodbond/common/theme/app_size.dart';
import 'package:bloodbond/features/profile/widgets/setting_item.widget.dart';
import 'package:bloodbond/generated/assets.gen.dart';
import 'package:flutter/material.dart';

class SettingList extends StatelessWidget {
  const SettingList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SettingItem(
          icon: Assets.icons.profile.availableTime,
          title: 'Available for donate',
          hasSwitch: true,
        ),
        AppSize.h12,
        SettingItem(
          icon: Assets.icons.profile.inviteEmail,
          title: 'Invite a friend',
        ),
        AppSize.h12,
        SettingItem(
          icon: Assets.icons.profile.getHelp,
          title: 'Get help',
        ),
        AppSize.h12,
        SettingItem(
          icon: Assets.icons.profile.signOut,
          title: 'Sign out',
        ),
      ],
    );
  }
}
