import 'package:flutter/material.dart';
import 'package:flutter_design_system/flutter_design_system.dart';
import 'package:provider/provider.dart';
import 'package:tomorrow_house/route_path.dart';
import 'package:tomorrow_house/service/cart_service.dart';

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
        onPressed: () {
          /// CartPage로 이동
          Navigator.pushNamed(context, RoutePath.cart);
        },
      ),
    );
  }
}
