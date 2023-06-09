import 'package:bloodbond/common/theme/color_styles.dart';
import 'package:bloodbond/common/theme/text_styles.dart';
import 'package:bloodbond/generated/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InformationItem extends StatefulWidget {
  const InformationItem({
    super.key,
    required this.icon,
    required this.title,
    this.route,
  });

  final SvgGenImage icon;
  final String title;
  final String? route;

  @override
  State<InformationItem> createState() => _InformationItemState();
}

class _InformationItemState extends State<InformationItem> {
  final double _height = 55.h;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.route != null) {
          Navigator.of(context).pushNamed(widget.route!);
        }
      },
      child: Container(
        height: _height,
        padding: const EdgeInsets.fromLTRB(0, 0, 18, 0),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 26,
              spreadRadius: -6,
              color: const Color(0xFF565656).withOpacity(0.12),
            )
          ],
          borderRadius: BorderRadius.circular(4),
        ),
        child: Row(
          children: [
            Container(
              width: _height,
              height: _height,
              padding: EdgeInsets.all(18.h),
              child: widget.icon.svg(),
            ),
            Expanded(
              child: Text(
                widget.title,
                style: TextStyles.s17MediumText.copyWith(color: ColorStyles.gray),
              ),
            ),
            const Icon(
              Icons.chevron_right,
              color: Colors.red,
              size: 23,
            )
          ],
        ),
      ),
    );
  }
}
