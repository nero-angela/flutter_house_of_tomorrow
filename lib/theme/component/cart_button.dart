import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:house_of_tomorrow/src/service/cart_service.dart';
import 'package:house_of_tomorrow/theme/component/button/button.dart';
import 'package:house_of_tomorrow/theme/component/counter_badge.dart';
import 'package:house_of_tomorrow/util/route_path.dart';

class CartButton extends ConsumerWidget {
  const CartButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int count = ref.watch(cartServiceProvider).length;
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
