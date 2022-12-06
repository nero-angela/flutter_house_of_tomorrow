import 'package:flutter/material.dart';
import 'package:tomorrow_house/view/theme/core/app_theme.dart';
import 'package:tomorrow_house/view/theme/dark_theme.dart';
import 'package:tomorrow_house/view/theme/light_theme.dart';

class ThemeService with ChangeNotifier {
  ThemeService({
    required this.theme,
  });

  /// 현재 테마
  AppTheme theme;

  /// 테마 변경
  void toggleTheme() {
    if (theme.brightness == Brightness.light) {
      theme = DarkTheme();
    } else {
      theme = LightTheme();
    }
    notifyListeners();
  }
}
