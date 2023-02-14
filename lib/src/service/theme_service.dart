import 'package:flutter/material.dart';
import 'package:house_of_tomorrow/theme/dark_theme.dart';
import 'package:house_of_tomorrow/theme/foundation/app_theme.dart';
import 'package:house_of_tomorrow/theme/light_theme.dart';

class ThemeService with ChangeNotifier {
  ThemeService({
    AppTheme? theme,
  }) : theme = theme ?? LightTheme();

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
