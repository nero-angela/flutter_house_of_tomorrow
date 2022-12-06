part of 'app_theme.dart';

class AppFont {
  AppFont({
    required this.fontFamily,
    required this.light,
    required this.regular,
    required this.semiBold,
    required this.fontColor,
  });

  /// Font Family
  final String fontFamily;

  /// Font Weight
  final FontWeight light;
  final FontWeight regular;
  final FontWeight semiBold;

  /// Font Color
  final Color fontColor;

  /// Headline
  late final TextStyle headline1 = TextStyle(
    height: 1.3,
    fontFamily: fontFamily,
    fontWeight: regular,
    fontSize: 28,
    color: fontColor,
  );
  late final TextStyle headline2 = TextStyle(
    height: 1.3,
    fontFamily: fontFamily,
    fontWeight: regular,
    fontSize: 24,
    color: fontColor,
  );
  late final TextStyle headline3 = TextStyle(
    height: 1.3,
    fontFamily: fontFamily,
    fontWeight: regular,
    fontSize: 21,
    color: fontColor,
  );
  late final TextStyle headline4 = TextStyle(
    height: 1.3,
    fontFamily: fontFamily,
    fontWeight: regular,
    fontSize: 20,
    color: fontColor,
  );
  late final TextStyle headline5 = TextStyle(
    height: 1.3,
    fontFamily: fontFamily,
    fontWeight: regular,
    fontSize: 19,
    color: fontColor,
  );
  late final TextStyle headline6 = TextStyle(
    height: 1.3,
    fontFamily: fontFamily,
    fontWeight: regular,
    fontSize: 18,
    color: fontColor,
  );

  /// Subtitle
  late final TextStyle subtitle1 = TextStyle(
    height: 1.3,
    fontFamily: fontFamily,
    fontWeight: regular,
    fontSize: 16,
    color: fontColor,
  );
  late final TextStyle subtitle2 = TextStyle(
    height: 1.3,
    fontFamily: fontFamily,
    fontWeight: regular,
    fontSize: 15,
    color: fontColor,
  );

  /// Body
  late final TextStyle body1 = TextStyle(
    height: 1.3,
    fontFamily: fontFamily,
    fontWeight: regular,
    fontSize: 14,
    color: fontColor,
  );
  late final TextStyle body2 = TextStyle(
    height: 1.3,
    fontFamily: fontFamily,
    fontWeight: regular,
    fontSize: 12,
    color: fontColor,
  );
}
