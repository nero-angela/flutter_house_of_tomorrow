import 'package:flutter/material.dart';
import 'package:house_of_tomorrow/src/service/cart_service.dart';
import 'package:house_of_tomorrow/theme/component/button/button.dart';
import 'package:house_of_tomorrow/theme/component/counter_badge.dart';
import 'package:house_of_tomorrow/util/route_path.dart';
import 'package:provider/provider.dart';

class CartButton extends StatelessWidget {
  const CartButton({super.key});

  @override
  Widget build(BuildContext context) {
    int count = context.watch<CartService>().cartItemList.length;
    return CounterBadge(
      label: "$count",
      isShow: count > 0,
      child: Button(
        icon: 'basket',
        type: ButtonType.flat,
        onPressed: () {
          Navigator.pushNamed(context, RoutePath.cart);
        },
      ),
    );
  }
}
