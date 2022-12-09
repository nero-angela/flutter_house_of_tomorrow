import 'package:flutter/material.dart';
import 'package:flutter_design_system/flutter_design_system.dart';
import 'package:provider/provider.dart';
import 'package:tomorrow_house/service/cart_service.dart';
import 'package:tomorrow_house/view/component/arrow_back_button.dart';
import 'package:tomorrow_house/view/lang/generated/l10n.dart';
import 'package:tomorrow_house/view/page/cart/widget/cart_bottom_sheet.dart';
import 'package:tomorrow_house/view/page/cart/widget/cart_delete_dialog.dart';
import 'package:tomorrow_house/view/page/cart/widget/cart_empty.dart';
import 'package:tomorrow_house/view/page/cart/widget/cart_item_list.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cartService = context.watch<CartService>();
    return Scaffold(
      appBar: AppBar(
        title: Text(S.current.cart),
        leading: const ArrowBackButton(),
        actions: [
          /// Delete
          Button(
            text: S.current.delete,
            type: ButtonType.flat,
            color: context.color.secondary,
            isInactive: cartService.selectedCartItemList.isEmpty,
            onPressed: () {
              /// Delete dialog
              showDialog(
                context: context,
                builder: (context) {
                  return CartDeleteDialog(cartService: cartService);
                },
              );
            },
          ),
        ],
      ),
      body: context.responsive(
        /// Mobile & Tablet
        Column(
          children: [
            Expanded(
              child: cartService.cartItemList.isEmpty

                  /// Empty
                  ? const CartEmpty()

                  /// Not Empty
                  : CartItemList(cartService: cartService),
            ),

            /// BottomSheet
            CartBottomSheet(cartService: cartService),
          ],
        ),

        /// Desktop
        desktop: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 32,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    color: context.color.surface,
                    boxShadow: context.deco.shadow,
                  ),
                  padding: const EdgeInsets.all(16),
                  child: cartService.cartItemList.isEmpty

                      /// Empty
                      ? const CartEmpty()

                      /// Not Empty
                      : CartItemList(cartService: cartService),
                ),
              ),
              const SizedBox(width: 16),

              /// BottomSheet
              Expanded(
                flex: 1,
                child: CartBottomSheet(cartService: cartService),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
