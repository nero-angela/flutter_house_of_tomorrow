import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:house_of_tomorrow/src/repository/product_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../dummy.dart';
import 'product_repository_test.mocks.dart';

@GenerateNiceMocks([MockSpec<Dio>()])
void main() {
  late MockDio dio;
  late ProductRepository productRepository;

  setUp(() {
    dio = MockDio();
    productRepository = ProductRepository(dio: dio);
  });

  group('ProductRepository', () {
    group('searchProductList()', () {
      test('통신 성공시 List<Product>를 반환한다.', () async {
        when(dio.get(productRepository.searchProductListUrl)).thenAnswer(
          (realInvocation) async => Response(
            data: Dummy.jsonProductList,
            statusCode: 200,
            requestOptions: RequestOptions(),
          ),
        );
        final results = await productRepository.searchProductList('');
        expect(results.isNotEmpty, true);
      });

      test('통신 실패시 빈 배열을 반환한다.', () async {
        when(dio.get(productRepository.searchProductListUrl)).thenAnswer(
          (realInvocation) async => Response(
            data: '',
            statusCode: 500,
            requestOptions: RequestOptions(),
          ),
        );
        final results = await productRepository.searchProductList('');
        expect(results.isEmpty, true);
      });

      test('이름이나 브랜드에 해당 키워드가 포함된 Product만 반환한다.', () async {});
    });
  });
}
