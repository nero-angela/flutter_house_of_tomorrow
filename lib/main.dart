import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:tomorrow_house/route_path.dart';
import 'package:tomorrow_house/service/cart_service.dart';
import 'package:tomorrow_house/service/theme_service.dart';
import 'package:tomorrow_house/view/lang/generated/l10n.dart';
import 'package:tomorrow_house/view/theme/light_theme.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ThemeService(
            theme: LightTheme(),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => CartService(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static final GlobalKey<NavigatorState> _navigatorKey = GlobalKey();
  static BuildContext? get context => _navigatorKey.currentContext;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      debugShowCheckedModeBanner: false,
      theme: context.watch<ThemeService>().themeData,
      initialRoute: RoutePath.shopping,
      onGenerateRoute: RoutePath.onGenerateRoute,
      navigatorKey: _navigatorKey,
      builder: (context, child) {
        child = Toast(
          navigatorKey: _navigatorKey,
          child: child ?? const SizedBox(),
        );
        return child;
      },
    );
  }
}
