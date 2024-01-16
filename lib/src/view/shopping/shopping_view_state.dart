import 'package:house_of_tomorrow/src/model/product.dart';
import 'package:house_of_tomorrow/src/view/base_view_state.dart';

class ShoppingViewState extends BaseViewState {
  const ShoppingViewState({
    required this.isBusy,
    required this.productList,
  });

  @override
  final bool isBusy;
  final List<Product> productList;

  ShoppingViewState copyWith({
    bool? isBusy,
    List<Product>? productList,
  }) {
    return ShoppingViewState(
      isBusy: isBusy ?? this.isBusy,
      productList: productList ?? this.productList,
    );
  }
}
