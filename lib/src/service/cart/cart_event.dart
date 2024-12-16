part of 'cart_service.dart';

abstract class CartServiceEvent {}

/// 상품 추가
class OnAddToCart extends CartServiceEvent {
  final CartItem newCartItem;

  OnAddToCart(this.newCartItem);
}

/// 상품 수정
class OnUpdateCart extends CartServiceEvent {
  final int selectedIndex;
  final CartItem newCartItem;

  OnUpdateCart(this.selectedIndex, this.newCartItem);
}

/// 상품 목록 삭제
class OnDeleteCartItemList extends CartServiceEvent {
  final List<CartItem> deleteList;

  OnDeleteCartItemList(this.deleteList);
}
