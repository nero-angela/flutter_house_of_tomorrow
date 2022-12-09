import 'package:flutter/material.dart';
import 'package:flutter_design_system/flutter_design_system.dart';
import 'package:tomorrow_house/helper/cart_item_helper.dart';
import 'package:tomorrow_house/service/cart_service.dart';
import 'package:tomorrow_house/view/lang/generated/l10n.dart';
import 'package:tomorrow_house/view/page/cart/widget/cart_checkout_dialog.dart';

class CartBottomSheet extends StatelessWidget {
  const CartBottomSheet({
    super.key,
    required this.cartService,
  });

  final CartService cartService;

  @override
  Widget build(BuildContext context) {
    /// Bottom Sheet
    return BaseBottomSheet(
      isRoundAll: context.responsive(false, desktop: true),
      padding: EdgeInsets.only(
        top: context.responsive(32, desktop: 16),
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
                style: context.font.headline3,
              ),
              const Spacer(),
              Text(
                S.current.items(
                  cartService.selectedCartItemList.length,
                ),
                style: context.font.headline3.copyWith(
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
                style: context.font.headline3,
              ),
              const Spacer(),
              Text(
                cartService.selectedCartItemList.totalPrice,
                style: context.font.headline3.copyWith(
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
            isInactive: cartService.selectedCartItemList.isEmpty,
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return CartCheckoutDialog(
                    cartService: cartService,
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
