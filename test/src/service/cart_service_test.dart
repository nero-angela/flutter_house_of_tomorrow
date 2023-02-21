import 'package:flutter_test/flutter_test.dart';
import 'package:house_of_tomorrow/src/service/cart_service.dart';

void main() {
  late CartService cartService;

  setUp(() {
    cartService = CartService();
  });

  group('CartService', () {
    group('add()', () {
      test('신규 CartItem을 cartItemList에 추가한다.', () {});
    });

    group('selectedCartItemList', () {
      test('isSelected가 true인 CartItem만 반환한다.', () {});
    });

    group('update()', () {
      test('선택한 index의 CartItem을 수정한다.', () {});
    });

    group('delete()', () {
      test('deleteList에 포함된 cartItemList의 CartItem을 삭제한다.', () {});
    });
  });
}
