import 'package:flutter/material.dart';

abstract class AppTheme {
  static final List<BoxShadow> primaryShadow = [
    BoxShadow(
      blurRadius: 12,
      offset: const Offset(0, 2),
      color: Colors.black.withOpacity(0.1),
    )
  ];
}
