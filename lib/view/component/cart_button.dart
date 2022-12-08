import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tomorrow_house/service/cart_service.dart';
import 'package:tomorrow_house/view/theme/component/badge.dart';
import 'package:tomorrow_house/view/theme/component/button.dart';

class CartButton extends StatelessWidget {
  const CartButton({super.key});

  @override
  Widget build(BuildContext context) {
    final CartService cartService = context.watch<CartService>();
    final int total = cartService.cartItemList.length;
    return Badge(
      isShow: total > 0,
      label: '$total',
      child: Button(
        icon: 'basket-outline.svg',
        type: ButtonType.flat,
        onPressed: () {},
      ),
    );
  }
}
