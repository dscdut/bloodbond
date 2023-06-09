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
          icon: Assets.icons.profile.editProfile,
          title: 'Edit profile',
          hasArrow: true,
        ),
        AppSize.h12,
        SettingItem(
          icon: Assets.icons.profile.availableTime,
          title: 'Display empty balances',
          hasSwitch: true,
        ),
        AppSize.h12,
        Row(
          // tạo 1 SizedBox cho nó thụt vào 1 khoảng
          crossAxisAlignment: CrossAxisAlignment.start,
          // tạo 1 SizedBox cho nó thụt vào 1 khoảng
          children: const [
            SizedBox(width: AppSize.horizontalSpace),
            Text(
              'Security and Privacy',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        AppSize.h12,
        SettingItem(
          icon: Assets.icons.profile.lock,
          title: 'Auto-Lock',
          hasSwitch: true,
        ),
        AppSize.h12,
        SettingItem(
          icon: Assets.icons.profile.availableTime,
          title: 'View secret recovery pharse',
          hasArrow: true,
        ),
        AppSize.h12,
        SettingItem(
          icon: Assets.icons.profile.info,
          title: 'Terms of Use',
          hasArrow: true,
        ),
        AppSize.h12,
        SettingItem(
          icon: Assets.icons.profile.info,
          title: 'Privacy policy',
          hasArrow: true,
        ),
        AppSize.h12,
        AppSize.h12,
        AppSize.h12,
        SizedBox(
          width: 309,
          height: 52,
          child: ElevatedButton(
            onPressed: () {
              // Navigator.of(context).pushNamed(AppRouter.recovery);
            },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              backgroundColor: const Color(0xFFFF2156),
            ),
            child: const Text(
              'Delete Wallet',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
