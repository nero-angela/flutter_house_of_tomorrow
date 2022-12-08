import 'package:tomorrow_house/helper/intl_helper.dart';
import 'package:tomorrow_house/model/product.dart';

extension ProductExt on Product {
  String get currency => IntlHelper.currency(
        symbol: priceUnit,
        number: price,
      );

  String totalPrice(int totalCount) => IntlHelper.currency(
        symbol: priceUnit,
        number: price * totalCount,
      );
}
