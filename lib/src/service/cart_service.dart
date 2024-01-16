import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:house_of_tomorrow/src/model/cart_item.dart';
import 'package:house_of_tomorrow/util/helper/immutable_helper.dart';

final cartServiceProvider =
    NotifierProvider<CartService, List<CartItem>>(CartService.new);

class CartService extends Notifier<List<CartItem>> {
  @override
  List<CartItem> build() => const [];

  /// 선택된 상품 목록
  List<CartItem> get selectedCartItemList {
    return state.where((cartItem) => cartItem.isSelected).toImmutable();
  }

  /// 상품 추가
  void add(CartItem newCartItem) {
    state = [...state, newCartItem].toImmutable();
  }

  /// 상품 수정
  void update(int selectedIndex, CartItem newCartItem) {
    state = state.asMap().entries.map((entry) {
      return entry.key == selectedIndex ? newCartItem : entry.value;
    }).toImmutable();
  }

  /// 상품 목록 삭제
  void delete(List<CartItem> deleteList) {
    state = state.where((cartItem) {
      return !deleteList.contains(cartItem);
    }).toImmutable();
  }
}
