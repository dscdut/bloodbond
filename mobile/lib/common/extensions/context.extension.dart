import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  /// The same of [MediaQuery.of(context).size]
  Size get mediaQuerySize => MediaQuery.of(this).size;

  double get height => mediaQuerySize.height;

  double get width => mediaQuerySize.width;

  double get sizeBoxHeight => MediaQuery.of(this).size.height * 0.1;

  ThemeData get theme => Theme.of(this);

  /// Check if dark mode theme is enable
  bool get isDarkMode => theme.brightness == Brightness.dark;

  /// similar to [MediaQuery.of(context).padding]
  EdgeInsets get mediaQueryPadding => MediaQuery.of(this).padding;

  double get paddingTop => mediaQueryPadding.top;

  double get paddingBottom => mediaQueryPadding.bottom;

  /// similar to [MediaQuery.of(context).devicePixelRatio]
  double get devicePixelRatio => MediaQuery.of(this).devicePixelRatio;
}
