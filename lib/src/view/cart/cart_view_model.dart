import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:house_of_tomorrow/src/model/cart_item.dart';
import 'package:house_of_tomorrow/src/service/cart_service.dart';
import 'package:house_of_tomorrow/src/view/base_view_model.dart';
import 'package:house_of_tomorrow/src/view/cart/cart_view_state.dart';
import 'package:house_of_tomorrow/theme/component/toast/toast.dart';
import 'package:house_of_tomorrow/util/helper/intl_helper.dart';
import 'package:house_of_tomorrow/util/lang/generated/l10n.dart';

final cartViewModelProvider =
    NotifierProvider.autoDispose<CartViewModel, CartViewState>(
        CartViewModel.new);

class CartViewModel extends BaseViewModel<CartViewState> {
  @override
  CartViewState build() {
    return CartViewState(isBusy: false,
    cartItemList: ref.watch(cartServiceProvider),
    );
  }

  CartService get cartService => ref.read(cartServiceProvider.notifier);

  /// 선택한 CartItem 목록
  List<CartItem> get selectedCartItemList => cartService.selectedCartItemList;

  /// 최종 가격
  String get totalPrice {
    return selectedCartItemList.isEmpty
        ? '0'
        : IntlHelper.currency(
            symbol: cartService.selectedCartItemList.first.product.priceUnit,
            number: cartService.selectedCartItemList.fold(0, (prev, curr) {
              return prev + curr.count * curr.product.price;
            }),
          );
  }

  /// 선택한 CartItem 삭제
  void onDeletePressed() {
    cartService.delete(cartService.selectedCartItemList);
    Toast.show(S.current.deleteDialogSuccessToast);
  }

  /// CartItem 클릭
  void onCartItemPressed(int index) {
    final cartItem = state.cartItemList[index];
    cartService.update(
      index,
      cartItem.copyWith(
        isSelected: !cartItem.isSelected,
      ),
    );
  }

  /// CartItem 개수 변경
  void onCountChanged(int index, int count) {
    cartService.update(
      index,
      state.cartItemList[index].copyWith(
        count: count,
      ),
    );
  }

  /// 선택한 CartItem 결제
  void onCheckoutPressed() {
    cartService.delete(cartService.selectedCartItemList);
    Toast.show(S.current.checkoutDialogSuccessToast);
  }
}
