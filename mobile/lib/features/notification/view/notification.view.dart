import 'package:bloodbond/common/theme/app_size.dart';
import 'package:bloodbond/common/theme/color_styles.dart';
import 'package:bloodbond/common/widgets/common_app_bar.widget.dart';
import 'package:bloodbond/generated/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloodbond/features/notification/bloc/notification.bloc.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NotificationBloc(),
      child: const _NotificationView(),
    );
  }
}

class _NotificationView extends StatelessWidget {
  const _NotificationView();

  Widget _buildDateHeader(String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 5, left: 4),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Color(0xFF000000),
        ),
      ),
    );
  }

  Widget _buildNotificationItem(
    double height,
    String date,
    String title,
    String content,
    String location,
    String information,
    Image imageAsset,
    bool showBloodType,
    bool showLocationInfo,
  ) {
    return Container(
      margin: const EdgeInsets.only(top: 5),
      width: double.infinity,
      height: height,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(9.68),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  date,
                  style: const TextStyle(
                    fontFamily: 'BeVietnamPro',
                    fontSize: 13,
                    color: Color(0xFF515151),
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  title,
                  style: const TextStyle(
                    fontFamily: 'BeVietnamPro',
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                    color: ColorStyles.primary,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  content,
                  style: const TextStyle(
                    fontFamily: 'BeVietnamPro',
                    fontSize: 16.5,
                    color: Color(0xFF515151),
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 3),
                if (showLocationInfo) // Hiển thị thông tin Location khi cần
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 3),
                      Text(
                        location, // Sử dụng thông tin location
                        style: const TextStyle(
                          fontFamily: 'BeVietnamPro',
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        information, // Sử dụng thông tin information
                        style: const TextStyle(
                          fontFamily: 'BeVietnamPro',
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          color: ColorStyles.boldGray,
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              children: [
                imageAsset,
                if (showBloodType)
                  const Positioned(
                    right: 2.5,
                    bottom: 5,
                    child: Text(
                      'B+',
                      style: TextStyle(
                        fontFamily: 'BeVietnamPro',
                        fontSize: 21,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationBloc, NotificationState>(
      builder: (context, state) {
        return Scaffold(
          appBar: const CommonAppBar(
            title: 'Notification',
            hasBoxDecoration: false,
          ),
          backgroundColor: const Color(0xFFF5F5F5),
          body: ListView.separated(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSize.horizontalSpace,
              vertical: AppSize.horizontalSpace,
            ),
            itemCount: 6,
            separatorBuilder: (context, index) => const SizedBox(height: 10),
            itemBuilder: (context, index) {
              switch (index) {
                case 0:
                  return _buildDateHeader('Today');
                case 1:
                  return _buildNotificationItem(
                    150,
                    'June 4th 2023, 23:59',
                    'Donation request',
                    "There's a person near you in need of a blood transfusion",
                    'Location',
                    'Hertford British Hospital',
                    Assets.icons.notification.blood.image(),
                    true,
                    true,
                  );
                case 2:
                  return _buildNotificationItem(
                    150,
                    'June 4th 2023, 23:59',
                    'Donation Acceptance',
                    'A person agreed to become a blood donor',
                    'Name',
                    'Tran Van Hoa',
                    Assets.icons.notification.doubleBlood.image(),
                    false,
                    true,
                  );
                case 3:
                  return _buildDateHeader('Yesterday');
                case 4:
                  return _buildNotificationItem(
                    100,
                    'June 3th 2023, 23:59',
                    'Donors recruitment ended',
                    'That person has found blood donor',
                    '',
                    '',
                    Assets.icons.notification.checkedIcon.image(),
                    false,
                    false,
                  );
                case 5:
                  return _buildNotificationItem(
                    150,
                    'June 4th 2023, 23:59',
                    'Donation request',
                    "There's a person near you in need of a blood transfusion",
                    'Location',
                    'Hertford British Hospital',
                    Assets.icons.notification.blood.image(),
                    true,
                    true,
                  );
                default:
                  return null;
              }
            },
          ),
        );
      },
    );
  }
}
