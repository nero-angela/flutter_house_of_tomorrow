import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tomorrow_house/repository/product_repository.dart';
import 'package:tomorrow_house/view/page/shopping/shopping_page_model.dart';

import '../../../../test_helper/dummy/dummy_product.dart';
import 'shopping_page_model_test.mocks.dart';

@GenerateNiceMocks([MockSpec<ProductRepository>()])
void main() {
  late MockProductRepository productRepository;
  late ShoppingPageModel shoppingPageModel;

  setUp(() {
    productRepository = MockProductRepository();
    shoppingPageModel = ShoppingPageModel(productRepository: productRepository);
  });

  group('ShoppingPageModel', () {
    group('search()', () {
      test('검색 결과를 productList에 할당한 뒤 화면을 갱신한다.', () async {
        /// notifyListeners 호출 횟수 카운터
        int nNotify = 0;

        when(productRepository.fetchProductList('')).thenAnswer(
          (_) async => dummyProductList,
        );

        shoppingPageModel.addListener(() {
          /// notifyListeners 호출시 실행
          nNotify++;
        });

        /// 검색
        await shoppingPageModel.searchProductList();

        /// fetchProductList() 함수 호출 횟수 확인
        verify(productRepository.fetchProductList('')).called(1);

        /// productList에 할당 여부 확인
        expect(
          shoppingPageModel.productList,
          dummyProductList,
        );

        /// 화면 갱신 횟수 : isBusy true / false 2번
        expect(nNotify, 2);
      });
    });
  });
}
