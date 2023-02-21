import 'package:flutter_test/flutter_test.dart';
import 'package:house_of_tomorrow/src/view/shopping/shopping_view_model.dart';

void main() {
  late ShoppingViewModel shoppingViewModel;

  setUp(() {
    shoppingViewModel = ShoppingViewModel();
  });

  group('ShoppingViewModel', () {
    group('searchProductList()', () {
      test('검색 결과를 productList에 할당한 뒤 화면을 갱신한다.', () async {});
    });
  });
}
