import 'package:flutter/material.dart';
import 'package:house_of_tomorrow/src/service/theme_service.dart';
import 'package:provider/provider.dart';

class ShoppingView extends StatelessWidget {
  const ShoppingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.color.surface,
      body: Center(
        child: TextButton(
          onPressed: context.read<ThemeService>().toggleTheme,
          child: Text(
            "Toggle Theme",
            style: context.typo.headline6,
          ),
        ),
      ),
    );
  }
}
