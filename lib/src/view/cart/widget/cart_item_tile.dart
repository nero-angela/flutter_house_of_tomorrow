import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:house_of_tomorrow/src/model/cart_item.dart';
import 'package:house_of_tomorrow/src/service/theme_service.dart';
import 'package:house_of_tomorrow/theme/component/asset_icon.dart';
import 'package:house_of_tomorrow/theme/component/counter_button.dart';
import 'package:house_of_tomorrow/util/helper/intl_helper.dart';

class CartItemTile extends StatelessWidget {
  const CartItemTile({
    super.key,
    required this.cartItem,
    required this.onPressed,
    required this.onCountChanged,
  });

  final CartItem cartItem;
  final void Function() onPressed;
  final void Function(int count) onCountChanged;

  @override
  Widget build(BuildContext context) {
    final productColor = cartItem.product.productColorList[cartItem.colorIndex];
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Stack(
              children: [
                /// Image
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: CachedNetworkImage(
                    imageUrl: productColor.imageUrl,
                    width: 92,
                    height: 92,
                    fit: BoxFit.cover,
                    color: context.color.background,
                    colorBlendMode: BlendMode.darken,
                  ),
                ),

                /// Check icon
                AssetIcon(
                  cartItem.isSelected ? 'check' : 'uncheck',
                  color: cartItem.isSelected
                      ? context.color.primary
                      : context.color.inactive,
                  size: 32,
                ),
              ],
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  /// Name
                  Text(
                    cartItem.product.name.toString(),
                    style: context.typo.headline5,
                  ),

                  const SizedBox(height: 12),

                  Row(
                    children: [
                      /// Price
                      Text(
                        IntlHelper.currency(
                          symbol: cartItem.product.priceUnit,
                          number: cartItem.product.price * cartItem.count,
                        ),
                        style: context.typo.subtitle1.copyWith(
                          color: context.color.subtext,
                        ),
                      ),
                      const Spacer(),

                      /// CounterButton
                      CounterButton(
                        count: cartItem.count,
                        onChanged: onCountChanged,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
