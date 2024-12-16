part of 'shopping_view_model.dart';

abstract class ShoppingViewEvent {}

class OnSearchProductList extends ShoppingViewEvent {
  final String keyword;

  OnSearchProductList(this.keyword);
}
