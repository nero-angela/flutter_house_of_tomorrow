import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tomorrow_house/service/theme_service.dart';
import 'package:tomorrow_house/view/theme/light_theme.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ThemeService(
            theme: LightTheme(),
          ),
        )
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Text("Hello Tomorrow House"),
        ),
      ),
    );
  }
}
