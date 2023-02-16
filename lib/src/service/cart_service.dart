import 'package:flutter/material.dart';
import 'package:house_of_tomorrow/src/model/cart_item.dart';
import 'package:house_of_tomorrow/util/helper/immutable_helper.dart';

class CartService with ChangeNotifier {
  /// 상품 목록
  List<CartItem> cartItemList = const [];

  /// 상품 추가
  void add(CartItem newCartItem) {
    cartItemList = [...cartItemList, newCartItem].toImmutable();
    notifyListeners();
  }
}
