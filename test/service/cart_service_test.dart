import 'package:flutter_test/flutter_test.dart';
import 'package:tomorrow_house/model/cart_item.dart';
import 'package:tomorrow_house/service/cart_service.dart';

import '../../test_helper/dummy/dummy_cart_item.dart';

void main() {
  late CartService cartService;

  setUp(() {
    cartService = CartService();
  });

  group('CartService', () {
    group('addToCart()', () {
      test('cartItemList에 추가되어야 한다.', () {
        cartService.addToCart(dummyCartItem);
        expect(cartService.cartItemList.contains(dummyCartItem), true);
      });
    });

    group('selectedCartItemList()', () {
      test('isSelected가 true인 CartItem만 반환해야 한다.', () {
        cartService.addToCart(dummyCartItem.copyWith(isSelected: false));
        cartService.addToCart(dummyCartItem.copyWith(isSelected: true));
        expect(cartService.selectedCartItemList.length, 1);
      });
    });

    group('updateCartItem()', () {
      test('선택한 index의 CartItem이 수정되어야 한다.', () {
        cartService.addToCart(dummyCartItem);
        const int index = 0;
        const int count = 100;
        final bool isSelected = !dummyCartItem.isSelected;
        final CartItem updatedCartItem = dummyCartItem.copyWith(
          count: count,
          isSelected: isSelected,
        );
        cartService.updateCartItem(index, updatedCartItem);
        expect(cartService.cartItemList[index].count, count);
        expect(cartService.cartItemList[index].isSelected, isSelected);
      });
    });

    group('deleteSelectedCartList()', () {
      test('isSelected 값이 true인 CartItem들이 삭제되어야 한다.', () {
        cartService.addToCart(dummyCartItem.copyWith(isSelected: false));
        cartService.addToCart(dummyCartItem.copyWith(isSelected: true));
        cartService.addToCart(dummyCartItem.copyWith(isSelected: false));
        cartService.addToCart(dummyCartItem.copyWith(isSelected: true));
        cartService.deleteSelectedCartList();
        expect(cartService.selectedCartItemList.isEmpty, true);
        expect(cartService.cartItemList.length, 2);
      });
    });
  });
}