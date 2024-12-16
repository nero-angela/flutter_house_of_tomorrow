import 'package:house_of_tomorrow/src/model/cart_item.dart';
import 'package:house_of_tomorrow/src/model/product.dart';
import 'package:house_of_tomorrow/src/service/cart/cart_service.dart';
import 'package:house_of_tomorrow/src/view/base_view_model.dart';
import 'package:house_of_tomorrow/src/view/base_view_state.dart';
import 'package:house_of_tomorrow/theme/component/toast/toast.dart';
import 'package:house_of_tomorrow/util/lang/generated/l10n.dart';

part 'product_view_event.dart';
part 'product_view_state.dart';

class ProductViewModel
    extends BaseViewModel<ProductViewEvent, ProductViewState> {
  ProductViewModel({
    required this.cartService,
    required Product product,
  }) : super(ProductViewState(
          isBusy: false,
          product: product,
          count: 1,
          colorIndex: 0,
        )) {
    /// 수량 업데이트 이벤트 함수
    on<OnCountChanged>((event, emit) {
      emit(state.copyWith(count: event.newCount));
    });

    /// 색상 업데이트 이벤트 함수
    on<OnColorIndexChanged>((event, emit) {
      emit(state.copyWith(colorIndex: event.newColorIndex));
    });

    /// 카트에 상품 추가
    on<OnAddToCartPressed>((event, emit) {
      final CartItem newCartItem = CartItem(
        colorIndex: state.colorIndex,
        count: state.count,
        isSelected: true,
        product: product,
      );
      cartService.add(OnAddToCart(newCartItem));
      Toast.show(S.current.productAdded(product.name));
    });
  }

  final CartService cartService;
}
