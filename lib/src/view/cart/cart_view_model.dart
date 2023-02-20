import 'package:house_of_tomorrow/src/service/cart_service.dart';
import 'package:house_of_tomorrow/src/view/base_view_model.dart';

class CartViewModel extends BaseViewModel {
  CartViewModel({
    required this.cartService,
  }) {
    cartService.addListener(notifyListeners);
  }

  final CartService cartService;

  @override
  void dispose() {
    cartService.removeListener(notifyListeners);
    super.dispose();
  }
}
