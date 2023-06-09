import 'package:flutter/material.dart';

class NotificationList extends StatelessWidget {
  const NotificationList({
    this.displayDateTime = 'abc',
    this.notificationHeading = 'bcd',
    this.notificationDescription = 'cde',
    super.key,
  });

  final String displayDateTime;
  final String notificationHeading;
  final String notificationDescription;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: Container(
        width: 362,
        height: 141.32,
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(9.68),
        ),
      ),
    );
  }
}
