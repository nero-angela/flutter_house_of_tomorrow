import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:house_of_tomorrow/src/model/cart_item.dart';
import 'package:house_of_tomorrow/src/service/cart/cart_service.dart';

import '../../dummy.dart';

void main() {
  group('CartService', () {
    group('add()', () {
      blocTest(
        '신규 CartItem을 cartItemList에 추가한다.',
        build: () => CartService(),
        act: (cartService) async {
          cartService.add(OnAddToCart(Dummy.cartItem));
        },
        expect: () => [
          [Dummy.cartItem]
        ],
      );
    });

    group('update()', () {
      blocTest(
        '선택한 index의 CartItem을 수정한다.',
        build: () => CartService(),
        act: (cartService) {
          cartService.add(OnAddToCart(Dummy.cartItem));
          CartItem newCartItem = Dummy.cartItem.copyWith(
            count: 100,
          );
          cartService.add(OnUpdateCart(0, newCartItem));
        },
        expect: () => [
          [Dummy.cartItem],
          [Dummy.cartItem.copyWith(count: 100)],
        ],
      );
    });

    group('delete()', () {
      blocTest(
        'deleteList에 포함된 cartItemList의 CartItem을 삭제한다.',
        build: () => CartService(),
        act: (cartService) {
          cartService.add(
            OnAddToCart(Dummy.cartItem.copyWith(isSelected: true)),
          );
          cartService.add(
            OnAddToCart(Dummy.cartItem.copyWith(isSelected: true)),
          );
          cartService.add(
            OnAddToCart(Dummy.cartItem.copyWith(isSelected: false)),
          );
          cartService.add(
            OnAddToCart(Dummy.cartItem.copyWith(isSelected: false)),
          );
          cartService.add(OnDeleteCartItemList([
            Dummy.cartItem.copyWith(isSelected: true),
            Dummy.cartItem.copyWith(isSelected: true),
          ]));
        },
        expect: () => [
          [Dummy.cartItem.copyWith(isSelected: true)],
          [
            Dummy.cartItem.copyWith(isSelected: true),
            Dummy.cartItem.copyWith(isSelected: true)
          ],
          [
            Dummy.cartItem.copyWith(isSelected: true),
            Dummy.cartItem.copyWith(isSelected: true),
            Dummy.cartItem.copyWith(isSelected: false)
          ],
          [
            Dummy.cartItem.copyWith(isSelected: true),
            Dummy.cartItem.copyWith(isSelected: true),
            Dummy.cartItem.copyWith(isSelected: false),
            Dummy.cartItem.copyWith(isSelected: false)
          ],
          [
            Dummy.cartItem.copyWith(isSelected: false),
            Dummy.cartItem.copyWith(isSelected: false)
          ],
        ],
      );
    });
  });
}
