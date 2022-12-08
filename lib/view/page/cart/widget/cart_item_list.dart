import 'package:flutter/material.dart';
import 'package:tomorrow_house/service/cart_service.dart';
import 'package:tomorrow_house/view/page/cart/widget/cart_item_tile.dart';

class CartItemList extends StatelessWidget {
  const CartItemList({
    Key? key,
    required this.cartService,
  }) : super(key: key);

  final CartService cartService;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: cartService.cartItemList.length,
      itemBuilder: (context, index) {
        final cartItem = cartService.cartItemList[index];
        return CartItemTile(
          cartItem: cartItem,
          onSelected: () {
            cartService.updateCartItem(
              index,
              cartItem.copyWith(
                isSelected: !cartItem.isSelected,
              ),
            );
          },
          onCounterChanged: (count) {
            cartService.updateCartItem(
              index,
              cartItem.copyWith(count: count),
            );
          },
        );
      },
    );
  }
}
