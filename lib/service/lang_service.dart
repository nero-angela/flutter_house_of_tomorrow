import 'package:flutter/material.dart';
import 'package:tomorrow_house/helper/intl_helper.dart';
import 'package:tomorrow_house/view/lang/generated/l10n.dart';

class LangService with ChangeNotifier {
  /// 현재 언어
  Locale get currentLocale => Locale(
        IntlHelper.isKo ? IntlHelper.ko : IntlHelper.en,
      );

  /// 언어 변경
  void toggleLang() {
    S.load(Locale(IntlHelper.isKo ? IntlHelper.en : IntlHelper.ko));
    notifyListeners();
  }
}
