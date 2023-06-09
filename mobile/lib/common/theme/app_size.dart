import 'package:flutter/material.dart';

abstract class AppSize {
  static const double horizontalSpace = 20;
  static const double cardRadius = 10;

  // App bar
  static const double appBarHeight = 60;
  static const double titleSpacing = 20;

  static const double buttonAndTextFieldHeight = 48;

  // Spacing
  static const SizedBox h12 = SizedBox(height: 12);
  static const SizedBox h16 = SizedBox(height: 16);
  static const SizedBox h40 = SizedBox(height: 40);

  static var verticalSpace;
}
