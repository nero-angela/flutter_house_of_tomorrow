import 'package:tomorrow_house/model/product.dart';
import 'package:tomorrow_house/view/base/base_view_model.dart';

class ProductPageModel extends BaseViewModel {
  ProductPageModel({
    required this.product,
  });

  final Product product;

  /// 선택된 색상 index
  int _colorIndex = 0;
  int get colorIndex => _colorIndex;
  set colorIndex(int colorIndex) {
    _colorIndex = colorIndex;
    notifyListeners();
  }

  /// 수량
  int _totalCount = 1;
  int get totalCount => _totalCount;
  set totalCount(int totalCount) {
    _totalCount = totalCount;
    notifyListeners();
  }
}
