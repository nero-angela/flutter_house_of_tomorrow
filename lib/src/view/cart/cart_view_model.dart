import 'dart:async';

import 'package:house_of_tomorrow/src/model/cart_item.dart';
import 'package:house_of_tomorrow/src/service/cart/cart_service.dart';
import 'package:house_of_tomorrow/src/view/base_view_model.dart';
import 'package:house_of_tomorrow/src/view/base_view_state.dart';
import 'package:house_of_tomorrow/theme/component/toast/toast.dart';
import 'package:house_of_tomorrow/util/helper/immutable_helper.dart';
import 'package:house_of_tomorrow/util/helper/intl_helper.dart';
import 'package:house_of_tomorrow/util/lang/generated/l10n.dart';

part 'cart_view_event.dart';
part 'cart_view_state.dart';

class CartViewModel extends BaseViewModel<CartViewEvent, CartViewState> {
  CartViewModel({
    required this.cartService,
  }) : super(CartViewState(
          isBusy: false,
          cartItemList: const [],
          selectedCartItemList: const [],
          totalPrice: '0',
        )) {
    /// Cart 업데이트
    on<OnCartUpdated>((event, emit) {
      final selectedCartItemList = event.cartItemList
          .where((cartItem) => cartItem.isSelected)
          .toImmutable<CartItem>();
      emit(
        state.copyWith(
            cartItemList: event.cartItemList,
            selectedCartItemList: selectedCartItemList,
            totalPrice: selectedCartItemList.isEmpty
                ? '0'
                : IntlHelper.currency(
                    symbol: selectedCartItemList.first.product.priceUnit,
                    number: selectedCartItemList.fold(0, (prev, curr) {
                      return prev + curr.count * curr.product.price;
                    }),
                  )),
      );
    });

    /// 선택한 CartItem 삭제
    on<OnDeletePressed>((event, emit) {
      cartService.add(OnDeleteCartItemList(state.selectedCartItemList));
      Toast.show(S.current.deleteDialogSuccessToast);
    });

    /// CartItem 클릭
    on<OnCartItemPressed>((event, emit) {
      final cartItem = state.cartItemList[event.index];
      cartService.add(OnUpdateCart(
        event.index,
        cartItem.copyWith(
          isSelected: !cartItem.isSelected,
        ),
      ));
    });

    /// CartItem 개수 변경
    on<OnCountChanged>((event, emit) {
      final cartItem = state.cartItemList[event.index];
      cartService.add(OnUpdateCart(
        event.index,
        cartItem.copyWith(
          count: event.count,
        ),
      ));
    });

    /// 선택한 CartItem 결제
    on<OnCheckoutPressed>((event, emit) {
      cartService.add(OnDeleteCartItemList(state.selectedCartItemList));
      Toast.show(S.current.checkoutDialogSuccessToast);
    });

    /// Subscribe
    cartServiceSubs = cartService.stream.listen((cartItemList) {
      add(OnCartUpdated(cartItemList));
    });

    /// Init state
    add(OnCartUpdated(cartService.state));
  }

  final CartService cartService;
  late final StreamSubscription cartServiceSubs;

  @override
  Future<void> close() {
    cartServiceSubs.cancel();
    return super.close();
  }
}
