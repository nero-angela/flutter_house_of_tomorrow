import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:house_of_tomorrow/src/repository/product_repository.dart';
import 'package:house_of_tomorrow/src/view/base_view_model.dart';
import 'package:house_of_tomorrow/src/view/shopping/shopping_view_state.dart';

final shoppingViewModelProvider =
    NotifierProvider.autoDispose<ShoppingViewModel, ShoppingViewState>(
        ShoppingViewModel.new);

class ShoppingViewModel extends BaseViewModel<ShoppingViewState> {
  @override
  ShoppingViewState build() {
    return const ShoppingViewState(
      isBusy: false,
      productList: [],
    );
  }

  final TextEditingController textController = TextEditingController();

  String get keyword => textController.text.trim();

  Future<void> searchProductList() async {
    state = state.copyWith(isBusy: true);
    final results = await Future.wait([
      ref.read(productRepositoryProvider).searchProductList(keyword),
      Future.delayed(const Duration(milliseconds: 555)),
    ]);
    state = state.copyWith(isBusy: false, productList: results[0]);
  }
}
