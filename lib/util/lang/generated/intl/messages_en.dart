// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(n) => "${n} items";

  static String m1(name) => "${name} was added";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "addToCart": MessageLookupByLibrary.simpleMessage("Add to cart"),
        "cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
        "cart": MessageLookupByLibrary.simpleMessage("Cart"),
        "cartIsEmpty": MessageLookupByLibrary.simpleMessage(
            "There is no items in the cart."),
        "checkout": MessageLookupByLibrary.simpleMessage("Checkout"),
        "checkoutDialogDesc": MessageLookupByLibrary.simpleMessage(
            "Would you like to purchase the selected product?"),
        "checkoutDialogSuccessToast":
            MessageLookupByLibrary.simpleMessage("Purchased successfully."),
        "dark": MessageLookupByLibrary.simpleMessage("Dark"),
        "delete": MessageLookupByLibrary.simpleMessage("Delete"),
        "deleteDialogDesc": MessageLookupByLibrary.simpleMessage(
            "Do you want to delete the selected product?"),
        "deleteDialogSuccessToast": MessageLookupByLibrary.simpleMessage(
            "The selected items has been deleted."),
        "description": MessageLookupByLibrary.simpleMessage("Description"),
        "en": MessageLookupByLibrary.simpleMessage("English"),
        "items": m0,
        "ko": MessageLookupByLibrary.simpleMessage("Korean"),
        "language": MessageLookupByLibrary.simpleMessage("Language"),
        "light": MessageLookupByLibrary.simpleMessage("Light"),
        "noProduct":
            MessageLookupByLibrary.simpleMessage("There is no product."),
        "product": MessageLookupByLibrary.simpleMessage("Product"),
        "productAdded": m1,
        "quantity": MessageLookupByLibrary.simpleMessage("Quantity"),
        "searchProduct": MessageLookupByLibrary.simpleMessage("Search product"),
        "selectedItems": MessageLookupByLibrary.simpleMessage("Selected Items"),
        "shopping": MessageLookupByLibrary.simpleMessage("Shopping"),
        "theme": MessageLookupByLibrary.simpleMessage("Theme"),
        "totalPrice": MessageLookupByLibrary.simpleMessage("Total Price")
      };
}
