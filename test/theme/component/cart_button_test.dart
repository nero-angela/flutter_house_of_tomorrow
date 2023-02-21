import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:house_of_tomorrow/src/service/cart_service.dart';
import 'package:house_of_tomorrow/src/service/theme_service.dart';
import 'package:house_of_tomorrow/theme/component/cart_button.dart';
import 'package:provider/provider.dart';

import '../../dummy.dart';

void main() {
  group('CartButton', () {
    testWidgets('장바구니에 담긴 상품 개수를 보여준다.', (tester) async {
      /// Golden Test 폰트 로드
      final font = rootBundle.load('assets/fonts/NotoSans-Regular.ttf');
      final fontLoader = FontLoader('noto_sans')..addFont(font);
      await fontLoader.load();

      /// Widget Build
      final cartService = CartService();
      await tester.pumpWidget(
        MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: (context) => ThemeService(),
            ),
            ChangeNotifierProvider(
              create: (context) => cartService,
            ),
          ],
          child: const MaterialApp(
            home: Center(child: CartButton()),
          ),
        ),
      );

      /// 카트에 추가
      cartService.add(Dummy.cartItem);
      cartService.add(Dummy.cartItem);
      await tester.pumpAndSettle();

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
