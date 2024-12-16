part of 'shopping_view_model.dart';

class ShoppingViewState extends BaseViewState with EquatableMixin {
  ShoppingViewState({
    required super.isBusy,
    required this.productList,
  });

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

  @override
  List<Object?> get props => [
        isBusy,
        productList,
      ];

  @override
  String toString() {
    return "ShoppingViewState(isBusy: $isBusy, productList: ${productList.length})";
  }
}
