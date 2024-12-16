part of 'product_view_model.dart';

class ProductViewState extends BaseViewState {
  ProductViewState({
    required super.isBusy,
    required this.product,
    required this.count,
    required this.colorIndex,
  });

  /// 선택한 상품
  final Product product;

  /// 선택한 수량
  final int count;

  /// 선택한 색상
  final int colorIndex;
  ProductViewState copyWith({
    bool? isBusy,
    Product? product,
    int? count,
    int? colorIndex,
  }) {
    return ProductViewState(
      isBusy: isBusy ?? this.isBusy,
      product: product ?? this.product,
      count: count ?? this.count,
      colorIndex: colorIndex ?? this.colorIndex,
    );
  }
}
