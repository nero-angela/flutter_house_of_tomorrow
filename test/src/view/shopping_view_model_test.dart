import 'package:flutter_test/flutter_test.dart';
import 'package:house_of_tomorrow/src/repository/product_repository.dart';
import 'package:house_of_tomorrow/src/view/shopping/shopping_view_model.dart';
import 'package:mockito/annotations.dart';

import 'shopping_view_model_test.mocks.dart';

@GenerateNiceMocks([MockSpec<ProductRepository>()])
void main() {
  late MockProductRepository productRepository;
  late ShoppingViewModel shoppingViewModel;

  setUp(() {
    productRepository = MockProductRepository();
    shoppingViewModel = ShoppingViewModel(
      productRepository: productRepository,
    );
  });

  group('ShoppingViewModel', () {
    group('searchProductList()', () {
      test('검색 결과를 productList에 할당한 뒤 화면을 갱신한다.', () async {});
    });
  });
}
