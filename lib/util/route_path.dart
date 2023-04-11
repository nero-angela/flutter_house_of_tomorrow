import 'package:flutter/material.dart';
import 'package:house_of_tomorrow/src/model/product.dart';
import 'package:house_of_tomorrow/src/view/product/product_view.dart';
import 'package:house_of_tomorrow/src/view/shopping/shopping_view.dart';

abstract class RoutePath {
  static const String shopping = 'shopping';
  static const String product = 'product';

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    late final Widget page;
    switch (settings.name) {
      case RoutePath.shopping:
        page = const ShoppingView();
        break;
      case RoutePath.product:
        Product product = settings.arguments as Product;
        page = ProductView(product: product);
        break;
    }

    return MaterialPageRoute(
      builder: (context) => page,
    );
  }
}
