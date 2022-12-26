import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:tomorrow_house/main.dart' as app;
import 'package:tomorrow_house/view/component/cart_button.dart';
import 'package:tomorrow_house/view/page/cart/widget/cart_checkout_dialog.dart';
import 'package:tomorrow_house/view/page/shopping/widget/product_card.dart';
import 'package:tomorrow_house/view/theme/component/color_picker.dart';
import 'package:tomorrow_house/view/theme/component/counter_button.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  group("Tomorrow's House", () {
    testWidgets('제품 검색', (tester) async {
      /// 앱 실행
      app.main();
      await tester.pumpAndSettle();

      /// 텍스트 입력
      const String searchText = '3';
      await tester.enterText(find.byType(TextField), searchText);
      await tester.pumpAndSettle();

      /// 엔터
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pumpAndSettle();

      /// 검증
      expect(find.byType(ProductCard), findsOneWidget);
    });

    testWidgets('제품 결제', (tester) async {
      /// 앱 실행
      app.main();
      await tester.pumpAndSettle();

      /// 마지막 상품으로 드래그
      await tester.dragUntilVisible(
        find.byType(ProductCard).last,
        find.byType(MasonryGridView),
        const Offset(0, 100),
      );
      await tester.pumpAndSettle();

      /// 상품 클릭하여 ProductPage로 이동
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
      await tester.tap(addButton);
      await tester.pumpAndSettle();

      /// 장바구니에 담기
      await tester.tap(find.text('장바구니에 담기'));
      await tester.pumpAndSettle();

      /// 장바구니로 이동
      await tester.tap(find.byType(CartButton));
      await tester.pumpAndSettle();

      /// 결제 다이얼로그 띄우기
      await tester.tap(find.text('결제하기'));
      await tester.pumpAndSettle();

      /// 결제하기
      final checkoutButton = find
          .descendant(
            of: find.byType(CartCheckoutDialog),
            matching: find.text('결제하기'),
          )
          .last;
      await tester.tap(checkoutButton);
      await tester.pumpAndSettle();
    });
  });
}
