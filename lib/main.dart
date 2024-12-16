import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:house_of_tomorrow/src/repository/product_repository.dart';
import 'package:house_of_tomorrow/src/service/cart/cart_service.dart';
import 'package:house_of_tomorrow/src/service/lang/lang_service.dart';
import 'package:house_of_tomorrow/src/service/theme/theme_service.dart';
import 'package:house_of_tomorrow/util/lang/generated/l10n.dart';
import 'package:house_of_tomorrow/util/route_path.dart';

void main() {
  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => ProductRepository(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => ThemeService(),
          ),
          BlocProvider(
            create: (context) => LangService(),
          ),
          BlocProvider(
            create: (context) => CartService(),
          ),
        ],
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      builder: (context, child) {
        return Overlay(
          initialEntries: [
            OverlayEntry(builder: (context) => child!),
          ],
        );
      },
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      locale: context.watch<LangService>().state,
      theme: context.themeService.themeData,
      initialRoute: RoutePath.shopping,
      onGenerateRoute: RoutePath.onGenerateRoute,
    );
  }
}
