import 'package:flutter/material.dart';

abstract class AppShadow {
  static final List<BoxShadow> primaryShadow = [
    BoxShadow(
      blurRadius: 12,
      offset: const Offset(0, 2),
      color: Colors.black.withOpacity(0.1),
    )
  ];

  static final List<BoxShadow> requestFieldShadow = [
    BoxShadow(
      color: const Color(0xFF656565).withOpacity(0.1),
      blurRadius: 50,
    )
  ];
}
