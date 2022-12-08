import 'package:flutter/material.dart';
import 'package:tomorrow_house/model/product.dart';
import 'package:tomorrow_house/view/page/cart/cart_page.dart';
import 'package:tomorrow_house/view/page/product/product_page.dart';
import 'package:tomorrow_house/view/page/shopping/shopping_page.dart';

abstract class RoutePath {
  static const String shopping = 'shopping';
  static const String product = 'product';
  static const String cart = 'cart';

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    late final Widget page;
    switch (settings.name) {
      case RoutePath.shopping:
        page = const ShoppingPage();
        break;
      case RoutePath.product:
        Product product = settings.arguments as Product;
        page = ProductPage(product: product);
        break;
      case RoutePath.cart:
        page = const CartPage();
        break;
    }

    return MaterialPageRoute(
      builder: (context) {
        return page;
      },
    );
  }
}
