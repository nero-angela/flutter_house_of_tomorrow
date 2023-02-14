// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ko locale. All the
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
  String get localeName => 'ko';

  static String m0(n) => "${n} 개";

  static String m1(name) => "${name} 추가 완료";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "addToCart": MessageLookupByLibrary.simpleMessage("카트에 담기"),
        "cancel": MessageLookupByLibrary.simpleMessage("취소"),
        "cart": MessageLookupByLibrary.simpleMessage("카트"),
        "cartIsEmpty": MessageLookupByLibrary.simpleMessage("카트에 담긴 상품이 없어요."),
        "checkout": MessageLookupByLibrary.simpleMessage("결제하기"),
        "checkoutDialogDesc":
            MessageLookupByLibrary.simpleMessage("선택한 상품을 구매할까요?"),
        "checkoutDialogSuccessToast":
            MessageLookupByLibrary.simpleMessage("성공적으로 구매되었어요."),
        "dark": MessageLookupByLibrary.simpleMessage("다크"),
        "delete": MessageLookupByLibrary.simpleMessage("삭제"),
        "deleteDialogDesc":
            MessageLookupByLibrary.simpleMessage("선택한 상품을 카트에서 삭제할까요?"),
        "deleteDialogSuccessToast":
            MessageLookupByLibrary.simpleMessage("삭제 되었습니다."),
        "description": MessageLookupByLibrary.simpleMessage("설명"),
        "en": MessageLookupByLibrary.simpleMessage("영어"),
        "items": m0,
        "ko": MessageLookupByLibrary.simpleMessage("한국어"),
        "language": MessageLookupByLibrary.simpleMessage("언어"),
        "light": MessageLookupByLibrary.simpleMessage("라이트"),
        "noProduct": MessageLookupByLibrary.simpleMessage("상품이 없어요."),
        "product": MessageLookupByLibrary.simpleMessage("상품"),
        "productAdded": m1,
        "quantity": MessageLookupByLibrary.simpleMessage("수량"),
        "searchProduct": MessageLookupByLibrary.simpleMessage("상품 검색"),
        "selectedItems": MessageLookupByLibrary.simpleMessage("선택된 항목"),
        "shopping": MessageLookupByLibrary.simpleMessage("쇼핑"),
        "theme": MessageLookupByLibrary.simpleMessage("테마"),
        "totalPrice": MessageLookupByLibrary.simpleMessage("총 금액")
      };
}
