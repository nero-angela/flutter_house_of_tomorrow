import 'package:flutter/material.dart';
import 'package:house_of_tomorrow/src/model/cart_item.dart';

class CartService with ChangeNotifier {
  /// 상품 목록
  List<CartItem> cartItemList = const [];
}
