part of 'cart_view_model.dart';

class CartViewState extends BaseViewState {
  CartViewState({
    required super.isBusy,
    required this.cartItemList,
    required this.selectedCartItemList,
    required this.totalPrice,
  });

  final List<CartItem> cartItemList;
  final List<CartItem> selectedCartItemList;
  final String totalPrice;

  CartViewState copyWith({
    bool? isBusy,
    List<CartItem>? cartItemList,
    List<CartItem>? selectedCartItemList,
    String? totalPrice,
  }) {
    return CartViewState(
      isBusy: isBusy ?? this.isBusy,
      cartItemList: cartItemList ?? this.cartItemList,
      selectedCartItemList: selectedCartItemList ?? this.selectedCartItemList,
      totalPrice: totalPrice ?? this.totalPrice,
    );
  }
}
