import 'product.dart';

class CartItem {
  final Product product;
  final int colorIndex;
  final int count;
  final bool isSelected;

  const CartItem({
    required this.product,
    required this.colorIndex,
    required this.count,
    required this.isSelected,
  });

  CartItem copyWith({
    Product? product,
    int? count,
    int? colorIndex,
    bool? isSelected,
  }) {
    return CartItem(
      product: product ?? this.product,
      count: count ?? this.count,
      colorIndex: colorIndex ?? this.colorIndex,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}
