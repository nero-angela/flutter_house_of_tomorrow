import 'package:flutter/material.dart';
import 'package:tomorrow_house/service/theme_service.dart';
import 'package:tomorrow_house/view/lang/generated/l10n.dart';
import 'package:tomorrow_house/view/theme/component/button.dart';

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
          Button(
            onPressed: () {},
            icon: 'option-outline.svg',
            type: ButtonType.flat,
          ),
          Button(
            onPressed: () {},
            icon: 'basket-outline.svg',
            type: ButtonType.flat,
          ),
        ],
      ),
    );
  }
}
