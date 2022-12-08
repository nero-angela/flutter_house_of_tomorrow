import 'product.dart';

class CartItem {
  final Product product;
  final int colorIndex;
  final int count;

  const CartItem({
    required this.product,
    required this.colorIndex,
    required this.count,
  });
}
