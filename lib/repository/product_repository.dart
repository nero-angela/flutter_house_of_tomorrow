import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:tomorrow_house/helper/network_helper.dart';
import 'package:tomorrow_house/model/product.dart';

class ProductRepository {
  const ProductRepository({
    required this.dio,
  });

  final Dio dio;

  Future<List<Product>> fetchProductList(String keyword) async {
    try {
      final res = await dio.get(NetworkHelper.productListUrl);

      return jsonDecode(res.data).map<Product>((json) {
        return Product.fromJson(json);
      }).where((product) {
        /// 키워드가 비어있는 경우 모두 반환
        if (keyword.isEmpty) return true;

        /// name이나 brand에 키워드 포함 여부 확인
        return "${product.name}${product.brand}"
            .toLowerCase()
            .contains(keyword.toLowerCase());
      }).toList();
    } catch (e, s) {
      log('Failed to fetchProductList', error: e, stackTrace: s);
      return [];
    }
  }
}
