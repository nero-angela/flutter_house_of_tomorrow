import 'package:flutter/material.dart';
import 'package:tomorrow_house/model/product.dart';
import 'package:tomorrow_house/repository/product_repository.dart';
import 'package:tomorrow_house/view/base/base_view_model.dart';

class ShoppingPageModel extends BaseViewModel {
  List<Product> productList = [];
  final TextEditingController textController = TextEditingController();
  final ProductRepository productRepository = ProductRepository();
  String get keyword => textController.text.trim();

  Future<void> searchProductList() async {
    isBusy = true;
    final results = await Future.wait([
      productRepository.fetchProductList(keyword),
      Future.delayed(const Duration(milliseconds: 555)),
    ]);
    productList = results[0];
    isBusy = false;
  }
}
