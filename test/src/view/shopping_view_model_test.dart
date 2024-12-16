import 'package:bloc_test/bloc_test.dart';
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

  setUp(() {
    productRepository = MockProductRepository();
  });

  group('ShoppingViewModel', () {
    group('searchProductList()', () {
      blocTest(
        '검색 결과를 productList에 할당한 뒤 화면을 갱신한다.',
        setUp: () {
          when(productRepository.searchProductList('')).thenAnswer(
            (realInvocation) async => [Dummy.product],
          );
        },
        build: () {
          return ShoppingViewModel(productRepository: productRepository);
        },
        act: (shoppingViewModel) {
          shoppingViewModel.add(OnSearchProductList(''));
        },
        wait: const Duration(milliseconds: 600),
        expect: () => [
          ShoppingViewState(isBusy: true, productList: const []),
          ShoppingViewState(isBusy: false, productList: [Dummy.product]),
        ],
        verify: (bloc) {
          verify(productRepository.searchProductList('')).called(1);
        },
      );
    });
  });
}
