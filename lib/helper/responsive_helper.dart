import 'package:flutter/material.dart';

abstract class ResponsiveConfig {
  /// Device max width
  static const double mobileMaxWidth = 600;
  static const double tabletMaxWidth = 1000;
  static const double desktopMaxWidth = 1190;

  /// BottomSheet max width
  static const double bottomSheetMaxWidth = 600;
}

extension BuildContextResponsiveExt on BuildContext {
  /// Screen size
  Size get screenSize => MediaQuery.of(this).size;

  T responsive<T>(
    T defaultValue, {
    T? mobile,
    T? tablet,
    T? desktop,
  }) {
    if (screenSize.width < ResponsiveConfig.mobileMaxWidth) {
      return mobile ?? defaultValue;
    } else if (screenSize.width < ResponsiveConfig.tabletMaxWidth) {
      return tablet ?? defaultValue;
    } else {
      return desktop ?? defaultValue;
    }
  }
}