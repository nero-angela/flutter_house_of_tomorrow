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
}
