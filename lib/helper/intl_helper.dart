import 'package:intl/intl.dart';

abstract class IntlHelper {
  /// 지원 언어
  static const String en = 'en';
  static const String ko = 'ko';

  /// 한국어 여부
  static bool get isKo => Intl.getCurrentLocale().toLowerCase().contains(ko);

  /// Currency
  static String currency({
    required String symbol,
    required int number,
  }) {
    return NumberFormat.currency(
      symbol: symbol,
      locale: symbol == '￦' ? ko : en,
    ).format(number);
  }
}
