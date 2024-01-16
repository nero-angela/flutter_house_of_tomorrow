import 'package:house_of_tomorrow/src/model/cart_item.dart';
import 'package:house_of_tomorrow/src/view/base_view_state.dart';

class CartViewState extends BaseViewState {
  const CartViewState({
    required this.isBusy,
    required this.cartItemList,
  });

  @override
  final bool isBusy;
  final List<CartItem> cartItemList;

  CartViewState copyWith({
    bool? isBusy,
    List<CartItem>? cartItemList,
  }) {
    return CartViewState(
      isBusy: isBusy ?? this.isBusy,
      cartItemList: cartItemList ?? this.cartItemList,
    );
  }
}
