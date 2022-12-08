import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tomorrow_house/service/cart_service.dart';
import 'package:tomorrow_house/service/theme_service.dart';
import 'package:tomorrow_house/view/lang/generated/l10n.dart';
import 'package:tomorrow_house/view/page/cart/widget/cart_delete_dialog.dart';
import 'package:tomorrow_house/view/page/cart/widget/cart_empty.dart';
import 'package:tomorrow_house/view/page/cart/widget/cart_item_list.dart';
import 'package:tomorrow_house/view/theme/component/button.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cartService = context.watch<CartService>();
    return Scaffold(
      appBar: AppBar(
        title: Text(S.current.cart),
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
      body: cartService.cartItemList.isEmpty

          /// Empty
          ? const CartEmpty()

          /// Not Empty
          : CartItemList(cartService: cartService),
    );
  }
}
