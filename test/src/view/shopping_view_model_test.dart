import 'package:flutter_test/flutter_test.dart';
import 'package:house_of_tomorrow/src/repository/product_repository.dart';
import 'package:house_of_tomorrow/src/view/shopping/shopping_view_model.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../dummy.dart';
import 'shopping_view_model_test.mocks.dart';

@GenerateNiceMocks([MockSpec<ProductRepository>()])
void main() {
  late MockProductRepository productRepository;
  late ShoppingViewModel shoppingViewModel;

  /// notifyListeners() 호출 횟수
  late int nNotify;
  void notifyListener() => nNotify++;

  setUp(() {
    nNotify = 0;
    productRepository = MockProductRepository();
    shoppingViewModel = ShoppingViewModel(
      productRepository: productRepository,
    )..addListener(notifyListener);
  });

  tearDown(() {
    shoppingViewModel.removeListener(notifyListener);
  });

  group('ShoppingViewModel', () {
    group('searchProductList()', () {
      test('검색 결과를 productList에 할당한 뒤 화면을 갱신한다.', () async {
        when(productRepository.searchProductList('')).thenAnswer(
          (realInvocation) async => [Dummy.product],
        );

        await shoppingViewModel.searchProductList();

        /// 호출 여부 확인
        verify(productRepository.searchProductList('')).called(1);
        expect(shoppingViewModel.productList.length, 1);
        expect(nNotify, 2);
      });
    });
  });
}
