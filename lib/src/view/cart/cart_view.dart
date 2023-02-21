import 'package:flutter/material.dart';
import 'package:house_of_tomorrow/src/service/theme_service.dart';
import 'package:house_of_tomorrow/src/view/base_view.dart';
import 'package:house_of_tomorrow/src/view/cart/cart_view_model.dart';
import 'package:house_of_tomorrow/src/view/cart/widget/cart_bottom_sheet.dart';
import 'package:house_of_tomorrow/src/view/cart/widget/cart_checkout_dialog.dart';
import 'package:house_of_tomorrow/src/view/cart/widget/cart_delete_dialog.dart';
import 'package:house_of_tomorrow/src/view/cart/widget/cart_empty.dart';
import 'package:house_of_tomorrow/src/view/cart/widget/cart_item_tile.dart';
import 'package:house_of_tomorrow/src/view/cart/widget/cart_layout.dart';
import 'package:house_of_tomorrow/theme/component/button/button.dart';
import 'package:house_of_tomorrow/theme/component/pop_button.dart';
import 'package:house_of_tomorrow/util/lang/generated/l10n.dart';
import 'package:provider/provider.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: CartViewModel(
        cartService: context.read(),
      ),
      builder: (context, viewModel) => Scaffold(
        appBar: AppBar(
          title: Text(S.current.cart),
          leading: const PopButton(),
          titleSpacing: 0,
          actions: [
            /// Delete Button
            Button(
              onPressed: () {
                /// Show delete dialog
                showDialog(
                  context: context,
                  builder: (context) {
                    return CartDeleteDialog(
                      onDeletePressed: viewModel.onDeletePressed,
                    );
                  },
                );
              },
              text: S.current.delete,
              type: ButtonType.flat,
              color: context.color.secondary,
              isInactive: viewModel.selectedCartItemList.isEmpty,
            ),
          ],
        ),
        body: CartLayout(
          /// CartItemList
          cartItemList: viewModel.cartItemList.isEmpty
              ? const CartEmpty()
              : ListView.builder(
                  itemCount: viewModel.cartItemList.length,
                  itemBuilder: (context, index) {
                    final cartItem = viewModel.cartItemList[index];
                    return CartItemTile(
                      cartItem: cartItem,
                      onPressed: () {
                        viewModel.onCartItemPressed(index);
                      },
                      onCountChanged: (count) {
                        viewModel.onCountChanged(index, count);
                      },
                    );
                  },
                ),

          /// CartBottomSheet
          cartBottomSheet: CartBottomSheet(
            totalPrice: viewModel.totalPrice,
            selectedCartItemList: viewModel.selectedCartItemList,
            onCheckoutPressed: () {
              /// Show checkout dialog
              showDialog(
                context: context,
                builder: (context) {
                  return CartCheckoutDialog(
                    onCheckoutPressed: viewModel.onCheckoutPressed,
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
