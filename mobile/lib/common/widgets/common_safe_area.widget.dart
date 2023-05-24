import 'package:flutter/material.dart';
import 'package:bloodbond/common/extensions/context.extension.dart';
import 'package:bloodbond/common/theme/app_size.dart';

class AppSafeArea extends StatelessWidget {
  const AppSafeArea({super.key, required this.child, this.paddingBottom = 0});
  final Widget child;
  final double paddingBottom;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        AppSize.horizontalSpace,
        context.paddingTop,
        AppSize.horizontalSpace,
        paddingBottom,
      ),
      child: child,
    );
  }
}
