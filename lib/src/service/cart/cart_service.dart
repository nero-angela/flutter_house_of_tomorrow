import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:house_of_tomorrow/src/model/cart_item.dart';
import 'package:house_of_tomorrow/util/helper/immutable_helper.dart';

part 'cart_event.dart';

class CartService extends Bloc<CartServiceEvent, List<CartItem>> {
  CartService() : super(const []) {
    /// 상품 추가
    on<OnAddToCart>((event, emit) {
      emit([...state, event.newCartItem].toImmutable());
    });

    /// 상품 수정
    on<OnUpdateCart>((event, emit) {
      emit(
        state.asMap().entries.map((entry) {
          return entry.key == event.selectedIndex
              ? event.newCartItem
              : entry.value;
        }).toImmutable(),
      );
    });

    /// 상품 목록 삭제
    on<OnDeleteCartItemList>((event, emit) {
      emit(
        state.where((cartItem) {
          return !event.deleteList.contains(cartItem);
        }).toImmutable(),
      );
    });
  }
}
