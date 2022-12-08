import 'package:flutter/material.dart';
import 'package:tomorrow_house/helper/iterable_helper.dart';
import 'package:tomorrow_house/model/cart_item.dart';

class CartService with ChangeNotifier {
  /// Cart에 담긴 상품들
  List<CartItem> cartItemList = [].toImmutable();

  /// 선택한 CartItem 목록
  List<CartItem> get selectedCartItemList {
    return cartItemList.where((cartItem) => cartItem.isSelected).toList();
  }

  /// Cart에 상품 추가
  void addToCart(CartItem cartItem) {
    cartItemList = [...cartItemList, cartItem].toImmutable();
    notifyListeners();
  }

  /// 상품 수정
  void updateCartItem(int itemIndex, CartItem newCartItem) {
    cartItemList = cartItemList.asMap().entries.map<CartItem>((entry) {
      int index = entry.key;
      CartItem cartItem = entry.value;
      if (index == itemIndex) {
        return newCartItem;
      } else {
        return cartItem;
      }
    }).toImmutable();
    notifyListeners();
  }

  /// 선택한 상품 삭제
  void deleteSelectedCartList() {
    cartItemList = cartItemList.where((cartItem) {
      return !cartItem.isSelected;
    }).toImmutable();
    notifyListeners();
  }
}
