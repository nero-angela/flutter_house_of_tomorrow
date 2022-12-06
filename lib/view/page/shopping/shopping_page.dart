import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tomorrow_house/service/theme_service.dart';

class ShoppingPage extends StatelessWidget {
  const ShoppingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeService = context.watch<ThemeService>();
    final theme = themeService.theme;
    return Scaffold(
      backgroundColor: theme.color.surface,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: theme.color.surface,
        centerTitle: false,
        title: Text(
          'Shopping',
          style: theme.font.headline2,
        ),
        actions: [
          IconButton(
            onPressed: () {
              themeService.toggleTheme();
            },
            icon: Icon(
              Icons.dark_mode,
              color: theme.color.primary,
            ),
          ),
        ],
      ),
    );
  }
}
