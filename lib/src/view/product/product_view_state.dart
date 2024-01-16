import 'package:house_of_tomorrow/src/view/base_view_state.dart';

class ProductViewState extends BaseViewState {
  const ProductViewState({
    required this.isBusy,
    required this.count,
    required this.colorIndex,
  });

  @override
  final bool isBusy;

  /// 선택한 수량
  final int count;

  /// 선택한 색상
  final int colorIndex;

  ProductViewState copyWith({
    bool? isBusy,
    int? count,
    int? colorIndex,
  }) {
    return ProductViewState(
      isBusy: isBusy ?? this.isBusy,
      count: count ?? this.count,
      colorIndex: colorIndex ?? this.colorIndex,
    );
  }
}
