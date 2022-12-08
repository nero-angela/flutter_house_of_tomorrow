import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tomorrow_house/helper/intl_helper.dart';
import 'package:tomorrow_house/view/lang/generated/l10n.dart';
import 'package:tomorrow_house/view/theme/core/app_theme.dart';
import 'package:tomorrow_house/view/theme/dark_theme.dart';
import 'package:tomorrow_house/view/theme/light_theme.dart';

class ThemeService with ChangeNotifier {
  ThemeService({
    required this.theme,
  });

  /// 현재 테마
  AppTheme theme;

  /// 언어 변경
  void toggleLang() {
    S.load(Locale(IntlHelper.isKo ? IntlHelper.en : IntlHelper.ko));
    notifyListeners();
  }

  /// 테마 변경
  void toggleTheme() {
    if (theme.brightness == Brightness.light) {
      theme = DarkTheme();
    } else {
      theme = LightTheme();
    }
    notifyListeners();
  }

  /// Material ThemeData 커스텀
  ThemeData get themeData {
    return ThemeData(
      /// Scaffold
      scaffoldBackgroundColor: theme.color.surface,

      /// AppBar
      appBarTheme: AppBarTheme(
        titleSpacing: 0,
        backgroundColor: theme.color.surface,
        elevation: 0,
        centerTitle: false,
        iconTheme: IconThemeData(
          color: theme.color.text,
        ),
        titleTextStyle: theme.font.headline2.copyWith(
          color: theme.color.text,
        ),
      ),

      /// BottomSheet
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: Colors.transparent,
      ),
    );
  }
}

/// context를 이용해 바로 접근
extension BuildContextExt on BuildContext {
  AppTheme get theme => watch<ThemeService>().theme;
  AppColor get color => theme.color;
  AppDeco get deco => theme.deco;
  AppFont get font => theme.font;
}
