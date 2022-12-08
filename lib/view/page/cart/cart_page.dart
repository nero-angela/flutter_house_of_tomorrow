import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tomorrow_house/service/cart_service.dart';
import 'package:tomorrow_house/view/lang/generated/l10n.dart';
import 'package:tomorrow_house/view/page/cart/widget/cart_item_tile.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cartService = context.watch<CartService>();
    return Scaffold(
      appBar: AppBar(
        title: Text(S.current.cart),
      ),
      body: ListView.builder(
        itemCount: cartService.cartItemList.length,
        itemBuilder: (context, index) {
          final cartItem = cartService.cartItemList[index];
          return CartItemTile(
            cartItem: cartItem,
            onSelected: () {},
            onCounterChanged: (count) {},
          );
        },
      ),
    );
  }
}
