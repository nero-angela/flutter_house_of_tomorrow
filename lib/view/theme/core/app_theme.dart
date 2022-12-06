import 'package:flutter/material.dart';

part 'app_color.dart';
part 'app_deco.dart';
part 'app_font.dart';

abstract class AppTheme {
  late final Brightness brightness;
  late final AppColor color;
  late final AppDeco deco;
  late final AppFont font;
}
