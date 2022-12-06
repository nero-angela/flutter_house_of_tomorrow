import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tomorrow_house/service/theme_service.dart';

class ShoppingPage extends StatelessWidget {
  const ShoppingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Shopping',
          style: context.font.headline2,
        ),
        actions: [
          IconButton(
            onPressed: () {
              context.read<ThemeService>().toggleTheme();
            },
            icon: Icon(
              Icons.dark_mode,
              color: context.color.primary,
            ),
          ),
        ],
      ),
    );
  }
}
