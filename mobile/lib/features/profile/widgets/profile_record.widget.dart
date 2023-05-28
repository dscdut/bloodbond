import 'package:bloodbond/features/profile/widgets/profile_record_item.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileRecord extends StatelessWidget {
  const ProfileRecord({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final itemSize = (constraints.maxWidth - 2 * 35.w) / 3;

        return Padding(
          padding: EdgeInsets.symmetric(vertical: 30.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ProfileRecordItem(
                size: itemSize,
                title: 'A+',
                subTitle: 'Blood Type',
              ),
              ProfileRecordItem(
                size: itemSize,
                title: '05',
                subTitle: 'Donated',
              ),
              ProfileRecordItem(
                size: itemSize,
                title: '02',
                subTitle: 'Requested',
              ),
            ],
          ),
        );
      },
    );
  }
}
