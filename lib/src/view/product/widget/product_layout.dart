import 'package:flutter/material.dart';
import 'package:house_of_tomorrow/theme/res/layout.dart';

class ProductLayout extends StatelessWidget {
  const ProductLayout({
    super.key,
    required this.productInfo,
    required this.productBottomSheet,
  });

  final Widget productInfo;
  final Widget productBottomSheet;

  @override
  Widget build(BuildContext context) {
    return context.layout(
      /// Mobile & Tablet
      Column(
        children: [
          Expanded(child: productInfo),
          productBottomSheet,
        ],
      ),

      /// Desktop
      desktop: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(flex: 2, child: productInfo),
            const SizedBox(width: 16),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(top: 32),
                child: productBottomSheet,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
