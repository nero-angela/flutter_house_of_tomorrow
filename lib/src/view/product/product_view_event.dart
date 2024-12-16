part of 'product_view_model.dart';

abstract class ProductViewEvent {}

/// 수량 업데이트 이벤트 함수
class OnCountChanged extends ProductViewEvent {
  final int newCount;

  OnCountChanged(this.newCount);
}

/// 색상 업데이트 이벤트 함수
class OnColorIndexChanged extends ProductViewEvent {
  final int newColorIndex;

  OnColorIndexChanged(this.newColorIndex);
}

/// 카트에 상품 추가
class OnAddToCartPressed extends ProductViewEvent {}
