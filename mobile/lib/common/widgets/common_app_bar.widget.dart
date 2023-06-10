import 'package:flutter/material.dart';
import 'package:bloodbond/common/theme/app_size.dart';
import 'package:bloodbond/common/theme/color_styles.dart';
import 'package:bloodbond/common/theme/text_styles.dart';
import 'package:bloodbond/common/widgets/common_back_button.widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CommonAppBar({
    super.key,
    this.isCenterTitle = true,
    this.automaticallyImplyLeading = true,
    this.backgroundColor = Colors.white,
    this.titleColor = ColorStyles.zodiacBlue,
    this.toolbarHeight = AppSize.appBarHeight,
    this.titleSpacing = AppSize.titleSpacing,
    this.elevation = 0,
    this.bottomSize = 45,
    this.leadingWidth,
    this.leading,
    this.title,
    this.bottom,
    this.actions = const [],
    this.onLeadingAction,
    this.hasBoxDecoration = true,
  }) : assert(
          title is Widget || title is String || title == null,
          'Title only can be a widget or string ',
        );
  final bool isCenterTitle;
  final bool automaticallyImplyLeading;

  final Color backgroundColor;
  final Color titleColor;

  final double toolbarHeight;
  final double titleSpacing;
  final double elevation;
  final double bottomSize;
  final double? leadingWidth;

  final Widget? leading;
  final dynamic title;
  final Widget? bottom;
  final List<Widget> actions;

  final bool hasBoxDecoration;

  final Function()? onLeadingAction;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: isCenterTitle,
      backgroundColor: backgroundColor,
      elevation: elevation,
      
      toolbarHeight: toolbarHeight,
      titleSpacing: titleSpacing,
      titleTextStyle: TextStyles.mediumText.copyWith(
        color: titleColor,
        fontSize: 20.sp,
      ),
      automaticallyImplyLeading: false,
      title: title == null
          ? null
          : (title is Widget
              ? title
              : Text(
                  title,
                  style: TextStyles.boldAppbarTitle.copyWith(fontSize: 20.sp),
                )),
      bottom: bottom != null
          ? PreferredSize(
              preferredSize: Size.fromHeight(bottomSize),
              child: bottom!,
            )
          : null,
      actions: actions,
      leadingWidth: leadingWidth,
      leading: leading ??
          ((automaticallyImplyLeading && Navigator.of(context).canPop())
              ? CommonBackButton(
                  hasBoxDecoration: hasBoxDecoration,
                )
              : null),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(toolbarHeight);
}
