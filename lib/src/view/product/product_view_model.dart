import 'package:house_of_tomorrow/src/model/cart_item.dart';
import 'package:house_of_tomorrow/src/model/product.dart';
import 'package:house_of_tomorrow/src/service/cart_service.dart';
import 'package:house_of_tomorrow/src/view/base_view_model.dart';
import 'package:house_of_tomorrow/theme/component/toast/toast.dart';
import 'package:house_of_tomorrow/util/lang/generated/l10n.dart';

class ProductViewModel extends BaseViewModel {
  ProductViewModel({
    required this.cartService,
    required this.product,
  });

  final CartService cartService;

  /// 선택한 상품
  final Product product;

  /// 선택한 수량
  int count = 1;

  /// 선택한 색상
  int colorIndex = 0;

  /// 수량 업데이트 이벤트 함수
  void onCountChanged(int newCount) {
    count = newCount;
    notifyListeners();
  }

  /// 색상 업데이트 이벤트 함수
  void onColorIndexChanged(int newColorIndex) {
    colorIndex = newColorIndex;
    notifyListeners();
  }

  /// 카트에 상품 추가
  void onAddToCartPressed() {
    final CartItem newCartItem = CartItem(
      colorIndex: colorIndex,
      count: count,
      isSelected: true,
      product: product,
    );
    cartService.add(newCartItem);
    Toast.show(S.current.productAdded(product.name));
  }
}
