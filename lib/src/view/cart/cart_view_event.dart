part of 'cart_view_model.dart';

abstract class CartViewEvent {}

/// Cart 업데이트
class OnCartUpdated extends CartViewEvent {
  final List<CartItem> cartItemList;

  OnCartUpdated(this.cartItemList);
}

/// 선택한 CartItem 삭제
class OnDeletePressed extends CartViewEvent {}

/// CartItem 클릭
class OnCartItemPressed extends CartViewEvent {
  final int index;

  OnCartItemPressed(this.index);
}

/// CartItem 개수 변경
class OnCountChanged extends CartViewEvent {
  final int index;
  final int count;

  OnCountChanged({required this.index, required this.count});
}

/// 선택한 CartItem 결제
class OnCheckoutPressed extends CartViewEvent {}
