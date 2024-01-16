import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:house_of_tomorrow/src/model/cart_item.dart';
import 'package:house_of_tomorrow/src/model/product.dart';
import 'package:house_of_tomorrow/src/service/cart_service.dart';
import 'package:house_of_tomorrow/src/view/base_view_model.dart';
import 'package:house_of_tomorrow/src/view/product/product_view_state.dart';
import 'package:house_of_tomorrow/theme/component/toast/toast.dart';
import 'package:house_of_tomorrow/util/lang/generated/l10n.dart';

final productViewModelProvider =
    NotifierProvider.autoDispose<ProductViewModel, ProductViewState>(
        ProductViewModel.new);

class ProductViewModel extends BaseViewModel<ProductViewState> {
  @override
  ProductViewState build() {
    return const ProductViewState(
      isBusy: false,
      count: 1,
      colorIndex: 0,
    );
  }

  /// 수량 업데이트 이벤트 함수
  void onCountChanged(int newCount) {
    state = state.copyWith(
      count: newCount,
    );
  }

  /// 색상 업데이트 이벤트 함수
  void onColorIndexChanged(int newColorIndex) {
    state = state.copyWith(
      colorIndex: newColorIndex,
    );
  }

  /// 카트에 상품 추가
  void onAddToCartPressed(Product product) {
    final CartItem newCartItem = CartItem(
      colorIndex: state.colorIndex,
      count: state.count,
      isSelected: true,
      product: product,
    );
    ref.read(cartServiceProvider.notifier).add(newCartItem);
    Toast.show(S.current.productAdded(product.name));
  }
}
