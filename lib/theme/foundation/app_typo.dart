part of 'app_theme.dart';

class AppTypo {
  AppTypo({
    required this.typo,
    required this.fontColor,
  });

  /// Typo
  final Typo typo;

  /// Font Weight
  late FontWeight light = typo.light;
  late FontWeight regular = typo.regular;
  late FontWeight semiBold = typo.semiBold;

  /// Font Color
  final Color fontColor;

  /// Headline
  late final TextStyle headline1 = TextStyle(
    height: 1.3,
    fontFamily: typo.name,
    fontWeight: typo.regular,
    fontSize: 28,
    color: fontColor,
  );
  late final TextStyle headline2 = TextStyle(
    height: 1.3,
    fontFamily: typo.name,
    fontWeight: typo.regular,
    fontSize: 24,
    color: fontColor,
  );
  late final TextStyle headline3 = TextStyle(
    height: 1.3,
    fontFamily: typo.name,
    fontWeight: typo.regular,
    fontSize: 21,
    color: fontColor,
  );
  late final TextStyle headline4 = TextStyle(
    height: 1.3,
    fontFamily: typo.name,
    fontWeight: typo.regular,
    fontSize: 20,
    color: fontColor,
  );
  late final TextStyle headline5 = TextStyle(
    height: 1.3,
    fontFamily: typo.name,
    fontWeight: typo.regular,
    fontSize: 19,
    color: fontColor,
  );
  late final TextStyle headline6 = TextStyle(
    height: 1.3,
    fontFamily: typo.name,
    fontWeight: typo.regular,
    fontSize: 18,
    color: fontColor,
  );

  /// Subtitle
  late final TextStyle subtitle1 = TextStyle(
    height: 1.3,
    fontFamily: typo.name,
    fontWeight: typo.regular,
    fontSize: 16,
    color: fontColor,
  );
  late final TextStyle subtitle2 = TextStyle(
    height: 1.3,
    fontFamily: typo.name,
    fontWeight: typo.regular,
    fontSize: 15,
    color: fontColor,
  );

  /// Body
  late final TextStyle body1 = TextStyle(
    height: 1.3,
    fontFamily: typo.name,
    fontWeight: typo.regular,
    fontSize: 14,
    color: fontColor,
  );
  late final TextStyle body2 = TextStyle(
    height: 1.3,
    fontFamily: typo.name,
    fontWeight: typo.regular,
    fontSize: 12,
    color: fontColor,
  );
}
