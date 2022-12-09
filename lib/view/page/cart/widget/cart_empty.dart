import 'package:flutter/material.dart';
import 'package:flutter_design_system/flutter_design_system.dart';
import 'package:tomorrow_house/view/lang/generated/l10n.dart';

class CartEmpty extends StatelessWidget {
  const CartEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        S.current.cartIsEmpty,
        style: context.font.headline4.copyWith(
          color: context.color.inactive,
          fontWeight: context.font.light,
        ),
      ),
    );
  }
}
