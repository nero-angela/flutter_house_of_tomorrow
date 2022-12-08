import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tomorrow_house/helper/product_helper.dart';
import 'package:tomorrow_house/helper/toast_helper.dart';
import 'package:tomorrow_house/model/cart_item.dart';
import 'package:tomorrow_house/model/product.dart';
import 'package:tomorrow_house/service/cart_service.dart';
import 'package:tomorrow_house/service/theme_service.dart';
import 'package:tomorrow_house/view/lang/generated/l10n.dart';
import 'package:tomorrow_house/view/theme/component/base_bottom_sheet.dart';
import 'package:tomorrow_house/view/theme/component/button.dart';
import 'package:tomorrow_house/view/theme/component/counter_button.dart';

class ProductBottomSheet extends StatelessWidget {
  const ProductBottomSheet({
    super.key,
    required this.count,
    required this.colorIndex,
    required this.product,
    required this.onCountChanged,
  });

  final int count;
  final int colorIndex;
  final Product product;
  final void Function(int count) onCountChanged;

  @override
  Widget build(BuildContext context) {
    return BaseBottomSheet(
      padding: const EdgeInsets.only(
        top: 32,
        bottom: 16,
        left: 16,
        right: 16,
      ),
      child: Wrap(
        runSpacing: 16,
        children: [
          /// 수량
          Row(
            children: [
              Text(
                S.current.quantity,
                style: context.font.headline3,
              ),
              const Spacer(),

              /// Counter Button
              CounterButton(
                count: count,
                onChanged: onCountChanged,
              ),
            ],
          ),

          /// 가격
          Row(
            children: [
              Text(
                S.current.totalPrice,
                style: context.font.headline3,
              ),
              const Spacer(),
              Text(
                product.totalPrice(count),
                style: context.font.headline3.copyWith(
                  color: context.color.primary,
                ),
              ),
            ],
          ),

          /// 장바구니 담기
          Button(
            width: double.infinity,
            size: ButtonSize.large,
            text: S.current.addToCart,
            onPressed: () {
              final cartService = context.read<CartService>();

              /// Cart에 상품 추가
              cartService.addToCart(CartItem(
                product: product,
                colorIndex: colorIndex,
                count: count,
              ));

              /// 상품 추가 toast
              ToastHelper.show(
                S.current.productAdded(product.name),
              );
            },
          ),
        ],
      ),
    );
  }
}
