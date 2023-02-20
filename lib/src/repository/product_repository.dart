import 'dart:convert';
import 'dart:developer';

import 'package:house_of_tomorrow/src/model/product.dart';
import 'package:house_of_tomorrow/util/helper/network_helper.dart';

class ProductRepository {
  Future<List<Product>> searchProductList(String keyword) async {
    try {
      final res = await NetworkHelper.dio.get(
        'https://gist.githubusercontent.com/nero-angela/d16a5078c7959bf5abf6a9e0f8c2851a/raw/04fb4d21ddd1ba06f0349a890f5e5347d94d677e/ikeaSofaDataIBB.json',
      );

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
      log('Failed to searchProductList', error: e, stackTrace: s);
      return [];
    }
  }
}
