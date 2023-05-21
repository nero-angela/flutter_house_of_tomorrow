import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:house_of_tomorrow/main.dart' as app;
import 'package:house_of_tomorrow/src/view/cart/widget/cart_checkout_dialog.dart';
import 'package:house_of_tomorrow/src/view/shopping/widget/product_card.dart';
import 'package:house_of_tomorrow/theme/component/cart_button.dart';
import 'package:house_of_tomorrow/theme/component/color_picker.dart';
import 'package:house_of_tomorrow/theme/component/counter_button.dart';
import 'package:house_of_tomorrow/util/lang/generated/l10n.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  group("House Of Tomorrow", () {
    testWidgets('상품 결제', (tester) async {
      /// 앱 실행
      app.main();
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 1));

      /// ShoppingView 마지막 상품이 보일 때까지 드래그
      await tester.drag(
        find.byType(MasonryGridView),
        const Offset(0, -1000),
      );
      await tester.pumpAndSettle();

      /// 상품 클릭하여 ProductView로 이동
      await tester.tap(find.byType(ProductCard).last);
      await tester.pumpAndSettle();

      /// 마지막 색상 선택
      final lastColor = find
          .descendant(
            of: find.byType(ColorPicker),
            matching: find.byType(GestureDetector),
          )
          .last;
      await tester.tap(lastColor);
      await tester.pumpAndSettle();

      /// 수량 조절
      final addButton = find
          .descendant(
            of: find.byType(CounterButton),
            matching: find.byType(GestureDetector),
          )
          .last;
      await tester.tap(addButton);
      await tester.pumpAndSettle();
      await tester.tap(addButton);
      await tester.pumpAndSettle();

      /// 카트에 담기
      await tester.tap(find.text(S.current.addToCart));
      await tester.pumpAndSettle();

      /// CartView로 이동
      await tester.tap(find.byType(CartButton));
      await tester.pumpAndSettle();

      /// 결제 다이얼로그 띄우기
      await tester.tap(find.text(S.current.checkout));
      await tester.pumpAndSettle();

      /// 결제 완료
      final checkoutButton = find
          .descendant(
            of: find.byType(CartCheckoutDialog),
            matching: find.text(S.current.checkout),
          )
          .last;
      await tester.tap(checkoutButton);
      await tester.pumpAndSettle();
    });
  });
}
