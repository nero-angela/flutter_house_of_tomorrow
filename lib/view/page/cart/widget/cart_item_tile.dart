import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_design_system/flutter_design_system.dart';
import 'package:tomorrow_house/helper/product_helper.dart';
import 'package:tomorrow_house/model/cart_item.dart';

class CartItemTile extends StatelessWidget {
  const CartItemTile({
    super.key,
    required this.cartItem,
    required this.onSelected,
    required this.onCounterChanged,
  });

  final CartItem cartItem;
  final void Function() onSelected;
  final void Function(int count) onCounterChanged;

  @override
  Widget build(BuildContext context) {
    final productColor = cartItem.product.productColorList[cartItem.colorIndex];
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: onSelected,
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
                  cartItem.isSelected
                      ? 'checkmark-outline.svg'
                      : 'uncheckmark-outline.svg',
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
                    style: context.font.headline5,
                  ),

                  const SizedBox(height: 12),

                  Row(
                    children: [
                      /// Price
                      Text(
                        cartItem.product.totalPrice(cartItem.count),
                        style: context.font.subtitle1.copyWith(
                          color: context.color.subtext,
                        ),
                      ),
                      const Spacer(),

                      /// CounterButton
                      CounterButton(
                        count: cartItem.count,
                        onChanged: onCounterChanged,
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
