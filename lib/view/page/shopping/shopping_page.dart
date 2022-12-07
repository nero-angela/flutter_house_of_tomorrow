import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tomorrow_house/service/theme_service.dart';
import 'package:tomorrow_house/view/lang/generated/l10n.dart';

class ShoppingPage extends StatelessWidget {
  const ShoppingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.current.shopping,
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
          IconButton(
            onPressed: () {
              context.read<ThemeService>().toggleLang();
            },
            icon: Icon(
              Icons.language,
              color: context.color.primary,
            ),
          ),
        ],
      ),
    );
  }
}
