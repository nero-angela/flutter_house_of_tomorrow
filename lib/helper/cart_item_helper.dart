import 'package:intl/intl.dart';
import 'package:tomorrow_house/model/cart_item.dart';

extension CartItemListHelper on List<CartItem> {
  /// 전체 금액
  String get totalPrice {
    if (isEmpty) {
      return "0";
    }

    final total = fold(0, (previousValue, cartItem) {
      return previousValue + cartItem.count * cartItem.product.price;
    });
    return NumberFormat.currency(
      symbol: first.product.priceUnit,
    ).format(total);
  }
}