import 'package:intl/intl.dart';
import 'package:tomorrow_house/model/product.dart';

extension ProductExt on Product {
  String get currency => NumberFormat.currency(
        symbol: priceUnit,
      ).format(price);

  String totalPrice(int totalCount) => NumberFormat.currency(
      symbol: priceUnit,
    ).format(price * totalCount);
}
