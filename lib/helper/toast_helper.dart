import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tomorrow_house/main.dart';
import 'package:tomorrow_house/service/theme_service.dart';
import 'package:tomorrow_house/view/theme/core/app_theme.dart';

abstract class ToastHelper {
  static void show(String msg) {
    BuildContext? context = MyApp.context;
    if (context == null) return;

    AppTheme theme = context.read<ThemeService>().theme;
    Size deviceSize = MediaQuery.of(context).size;

    Toast.show(
      context,
      msg,
      duration: const Duration(seconds: 2),
      alignment: Alignment.topCenter,
      margin: EdgeInsets.only(
        top: deviceSize.height * 0.65,
      ),
      borderRadius: BorderRadius.circular(16),
      backgroundColor: theme.color.toastContainer,
      textStyle: theme.font.headline6.copyWith(
        color: theme.color.onToastContainer,
      ),
    );
  }
}
