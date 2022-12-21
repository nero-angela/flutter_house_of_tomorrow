import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tomorrow_house/helper/network_helper.dart';
import 'package:tomorrow_house/model/product.dart';
import 'package:tomorrow_house/repository/product_repository.dart';

import '../../test_helper/dummy/dummy_product.dart';
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
    group('fetchProductList()', () {
      test('성공시 List<Product>를 반환한다.', () async {
        when(dio.get(NetworkHelper.productListUrl)).thenAnswer(
          (realInvocation) async {
            return Response(
              data: dummyPrductListJsonString,
              statusCode: 200,
              requestOptions:
                  RequestOptions(path: NetworkHelper.productListUrl),
            );
          },
        );
        List<Product> results = await productRepository.fetchProductList('');
        expect(results.isNotEmpty, true);
      });

      test('전달한 키워드를 가진 List<Product>만 반환한다.', () async {
        when(dio.get(NetworkHelper.productListUrl)).thenAnswer(
          (realInvocation) async {
            return Response(
              data: dummyPrductListJsonString,
              statusCode: 200,
              requestOptions:
                  RequestOptions(path: NetworkHelper.productListUrl),
            );
          },
        );
        const String keyword = "3";
        List<Product> results = await productRepository.fetchProductList(
          keyword,
        );
        for (Product result in results) {
          expect(
            "${result.name}${result.brand}".toLowerCase().contains(keyword),
            true,
          );
        }
      });

      test('실패시 빈 배열을 반환한다.', () async {
        when(dio.get(NetworkHelper.productListUrl)).thenAnswer(
          (realInvocation) async {
            return Response(
              data: '',
              statusCode: 500, // 서버 에러
              requestOptions:
                  RequestOptions(path: NetworkHelper.productListUrl),
            );
          },
        );
        List<Product> results = await productRepository.fetchProductList('');
        expect(results.isEmpty, true);
      });
    });
  });
}
