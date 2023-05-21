import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:house_of_tomorrow/src/repository/product_repository.dart';
import 'package:mockito/annotations.dart';

@GenerateNiceMocks([MockSpec<Dio>()])
void main() {
  late ProductRepository productRepository;

  setUp(() {
    productRepository = ProductRepository();
  });

  group('ProductRepository', () {
    group('searchProductList()', () {
      test('통신 성공시 List<Product>를 반환한다.', () async {});

      test('통신 실패시 빈 배열을 반환한다.', () async {});

      test('이름이나 브랜드에 해당 키워드가 포함된 Product만 반환한다.', () async {});
    });
  });
}
