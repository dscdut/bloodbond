import 'package:bloodbond/common/theme/app_size.dart';
import 'package:bloodbond/common/theme/color_styles.dart';
import 'package:bloodbond/common/widgets/common_app_bar.widget.dart';
import 'package:bloodbond/generated/assets.gen.dart';
import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonAppBar(
      leading: Padding(
        padding: const EdgeInsets.fromLTRB(
          18,
          18,
          0,
          18,
        ),
        child: Assets.icons.appBar.menu.svg(),
      ),
      actions: const [
        Icon(
          Icons.notifications_outlined,
          color: ColorStyles.zodiacBlue,
          size: 30,
        ),
        SizedBox(
          width: AppSize.horizontalSpace,
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(AppSize.appBarHeight);
}
