import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:house_of_tomorrow/src/model/product.dart';
import 'package:house_of_tomorrow/src/repository/product_repository.dart';
import 'package:house_of_tomorrow/src/view/base_view_model.dart';
import 'package:house_of_tomorrow/src/view/base_view_state.dart';

part 'shopping_view_event.dart';
part 'shopping_view_state.dart';

class ShoppingViewModel
    extends BaseViewModel<ShoppingViewEvent, ShoppingViewState> {
  ShoppingViewModel({
    required this.productRepository,
  }) : super(ShoppingViewState(
          isBusy: false,
          productList: const [],
        )) {
    on<OnSearchProductList>((event, emit) async {
      emit(state.copyWith(isBusy: true));
      final results = await Future.wait([
        productRepository.searchProductList(event.keyword),
        Future.delayed(const Duration(milliseconds: 555)),
      ]);
      emit(state.copyWith(isBusy: false, productList: results[0]));
    });
  }

  final ProductRepository productRepository;
  final TextEditingController textController = TextEditingController();
  String get keyword => textController.text.trim();
}
