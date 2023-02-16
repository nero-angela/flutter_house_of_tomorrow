import 'product.dart';

class CartItem {
  /// 선택한 상품
  final Product product;

  /// 선택한 색상
  final int colorIndex;

  /// 선택한 수량
  final int count;

  /// 상품 선택 여부
  final bool isSelected;

  const CartItem({
    required this.product,
    required this.colorIndex,
    required this.count,
    required this.isSelected,
  });

  CartItem copyWith({
    Product? product,
    int? colorIndex,
    int? count,
    bool? isSelected,
  }) {
    return CartItem(
      product: product ?? this.product,
      colorIndex: colorIndex ?? this.colorIndex,
      count: count ?? this.count,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}
