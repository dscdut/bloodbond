import 'package:bloodbond/common/theme/app_size.dart';
import 'package:bloodbond/common/widgets/common_app_bar.widget.dart';
import 'package:bloodbond/generated/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloodbond/features/notification/bloc/notification.bloc.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

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
            padding: const EdgeInsets.only(
              left: AppSize.horizontalSpace,
              right: AppSize.horizontalSpace,
              bottom: AppSize.horizontalSpace + kBottomNavigationBarHeight,
            ),
            itemCount: 11, // Increase the item count to include the header
            separatorBuilder: (context, index) => const SizedBox(height: 10),
            itemBuilder: (context, index) {
              if (index == 0) {
                return const Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 5, left: 4),
                  child: Text(
                    'Today',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF000000),
                    ),
                  ),
                );
              }
              return Container(
                margin: const EdgeInsets.only(top: 10, bottom: 15),
                width: double.infinity,
                height: 121,
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
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
                        children: const [
                          Text(
                            'June 4th 2023, 23:59',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 11,
                              color: Color(0xFF515151),
                            ),
                          ),
                          SizedBox(height: 2),
                          Text(
                            'Head Line',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 15,
                              color: Color(0xFF272A2F),
                            ),
                          ),
                          SizedBox(height: 6),
                          Text(
                            'Lorem ipsum dolor sit amet, '
                            'consectetur adipiscing elit. Sed ut justo at massa ultrices'
                            'consectetur adipiscing elit. Sed ut justo at massa ultrices'
                            'consectetur adipiscing elit. Sed ut justo at massa ultrices',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 12.58,
                              color: Color(0xFF515151),
                            ),
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    Stack(
                      children: [
                        Assets.icons.notification.blood.image(),
                        const Positioned(
                          right: 2.5,
                          bottom: 3,
                          child: Text(
                            'B+',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 21,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
