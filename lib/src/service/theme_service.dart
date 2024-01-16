import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:house_of_tomorrow/theme/dark_theme.dart';
import 'package:house_of_tomorrow/theme/foundation/app_theme.dart';
import 'package:house_of_tomorrow/theme/light_theme.dart';
import 'package:house_of_tomorrow/theme/res/layout.dart';

final themeServiceProvider =
    NotifierProvider<ThemeService, AppTheme>(ThemeService.new);

class ThemeService extends Notifier<AppTheme> {
  @override
  AppTheme build() => LightTheme();

  /// 테마 변경
  void toggleTheme() {
    state = state.brightness == Brightness.light ? DarkTheme() : LightTheme();
  }

  /// Material ThemeData 커스텀
  ThemeData get themeData {
    return ThemeData(
      /// Scaffold
      scaffoldBackgroundColor: state.color.surface,

      /// AppBar
      appBarTheme: AppBarTheme(
        backgroundColor: state.color.surface,
        elevation: 0,
        centerTitle: false,
        iconTheme: IconThemeData(
          color: state.color.text,
        ),
        titleTextStyle: state.typo.headline2.copyWith(
          color: state.color.text,
        ),
      ),

      /// BottomSheet
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: Colors.transparent,
        constraints: BoxConstraints(
          maxWidth: Breakpoints.bottomSheet,
        ),
      ),
    );
  }
}

extension ThemeServiceExt on WidgetRef {
  ThemeService get themeService => watch(themeServiceProvider.notifier);
  AppTheme get theme => watch(themeServiceProvider);
  AppColor get color => theme.color;
  AppDeco get deco => theme.deco;
  AppTypo get typo => theme.typo;
}
