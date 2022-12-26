import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:tomorrow_house/service/cart_service.dart';
import 'package:tomorrow_house/service/theme_service.dart';
import 'package:tomorrow_house/view/component/cart_button.dart';
import 'package:tomorrow_house/view/theme/light_theme.dart';

import '../../../test_helper/dummy/dummy_cart_item.dart';

void main() {
  group('CartButton', () {
    testWidgets('장바구니에 담긴 상품 개수를 보여준다.', (tester) async {
      /// Golden Test 폰트 로드
      final font = rootBundle.load('asset/font/noto_sans/NotoSans-Regular.ttf');
      final fontLoader = FontLoader('noto_sans')..addFont(font);
      await fontLoader.load();

      /// Widget Build
      final cartService = CartService();
      await tester.pumpWidget(
        MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: (context) => ThemeService(theme: LightTheme()),
            ),
            ChangeNotifierProvider.value(
              value: cartService,
            ),
          ],
          child: const MaterialApp(
            home: Center(child: CartButton()),
          ),
        ),
      );

      /// 0인 경우 유저에게 보여주지 않음
      expect(
        tester.widget<CircleAvatar>(find.byType(CircleAvatar)).radius,
        0,
      );

      /// Badge 0 확인 (화면에 안보여도 위젯 트리에는 존재)
      expect(
        find.text("0"),
        findsOneWidget,
      );

      /// 카트에 추가
      cartService.addToCart(dummyCartItem);
      cartService.addToCart(dummyCartItem);
      await tester.pumpAndSettle();

      /// 0보다 큰 경우 유저에게 보여줌
      expect(
        tester.widget<CircleAvatar>(find.byType(CircleAvatar)).radius,
        greaterThan(0),
      );

      /// Badge 2 확인
      expect(
        find.text("2"),
        findsOneWidget,
      );

      /// Golden Test : 위젯 스크린 픽셀 비교
      /// "flutter test --update-goldens" 명령어로 정답 파일 생성 후 테스트 진행
      await expectLater(
        find.byType(CartButton),
        matchesGoldenFile('cart_button_golden_test.png'),
      );
    });
  });
}
