import 'package:flutter/material.dart';
import 'package:tomorrow_house/helper/iterable_helper.dart';
import 'package:tomorrow_house/model/cart_item.dart';

class CartService with ChangeNotifier {
  /// Cart에 담긴 상품들
  List<CartItem> cartItemList = [].toImmutable();

  /// Cart에 상품 추가
  void addToCart(CartItem cartItem) {
    cartItemList = [...cartItemList, cartItem].toImmutable();
    notifyListeners();
  }
}
