import 'package:flutter/material.dart';
import 'package:house_of_tomorrow/src/model/cart_item.dart';
import 'package:house_of_tomorrow/src/service/theme_service.dart';
import 'package:house_of_tomorrow/theme/component/bottom_sheet/base_bottom_sheet.dart';
import 'package:house_of_tomorrow/theme/component/button/button.dart';
import 'package:house_of_tomorrow/theme/res/layout.dart';
import 'package:house_of_tomorrow/util/lang/generated/l10n.dart';

class CartBottomSheet extends StatelessWidget {
  const CartBottomSheet({
    super.key,
    required this.totalPrice,
    required this.selectedCartItemList,
    required this.onCheckoutPressed,
  });

  final String totalPrice;
  final List<CartItem> selectedCartItemList;
  final void Function() onCheckoutPressed;

  @override
  Widget build(BuildContext context) {
    /// Bottom Sheet
    return BaseBottomSheet(
      isRoundAll: context.layout(false, desktop: true),
      padding: EdgeInsets.only(
        top: context.layout(32, desktop: 16),
        left: 16,
        right: 16,
        bottom: 16,
      ),
      child: Wrap(
        runSpacing: 16,
        children: [
          /// Selected Items
          Row(
            children: [
              Text(
                S.current.selectedItems,
                style: context.typo.headline3,
              ),
              const Spacer(),
              Text(
                S.current.items(
                  selectedCartItemList.length,
                ),
                style: context.typo.headline3.copyWith(
                  color: context.color.primary,
                ),
              ),
            ],
          ),

          /// Total Price
          Row(
            children: [
              Text(
                S.current.totalPrice,
                style: context.typo.headline3,
              ),
              const Spacer(),
              Text(
                totalPrice,
                style: context.typo.headline3.copyWith(
                  color: context.color.primary,
                ),
              ),
            ],
          ),

          /// Checkout
          Button(
            text: S.current.checkout,
            width: double.infinity,
            size: ButtonSize.large,
            isInactive: selectedCartItemList.isEmpty,
            onPressed: onCheckoutPressed,
          ),
        ],
      ),
    );
  }
}
