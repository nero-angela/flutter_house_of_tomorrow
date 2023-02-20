import 'package:flutter/material.dart';
import 'package:house_of_tomorrow/src/service/theme_service.dart';
import 'package:house_of_tomorrow/theme/res/layout.dart';

class CartLayout extends StatelessWidget {
  const CartLayout({
    super.key,
    required this.cartItemList,
    required this.cartBottomSheet,
  });

  final Widget cartItemList;
  final Widget cartBottomSheet;

  @override
  Widget build(BuildContext context) {
    return context.layout(
      /// Mobile & Tablet
      Column(
        children: [
          Expanded(child: cartItemList),
          cartBottomSheet,
        ],
      ),

      /// Desktop
      desktop: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 32,
          horizontal: 16,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: context.color.surface,
                  boxShadow: context.deco.shadow,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: cartItemList,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              flex: 1,
              child: cartBottomSheet,
            ),
          ],
        ),
      ),
    );
  }
}
