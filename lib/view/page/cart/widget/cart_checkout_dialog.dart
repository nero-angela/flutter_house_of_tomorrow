import 'package:flutter/material.dart';
import 'package:tomorrow_house/helper/toast_helper.dart';
import 'package:tomorrow_house/service/cart_service.dart';
import 'package:tomorrow_house/service/theme_service.dart';
import 'package:tomorrow_house/view/lang/generated/l10n.dart';
import 'package:tomorrow_house/view/theme/component/base_dialog.dart';
import 'package:tomorrow_house/view/theme/component/button.dart';

class CartCheckoutDialog extends StatelessWidget {
  const CartCheckoutDialog({
    Key? key,
    required this.cartService,
  }) : super(key: key);

  final CartService cartService;

  @override
  Widget build(BuildContext context) {
    return BaseDialog(
      title: S.current.checkout,
      content: Text(
        S.current.checkoutDialogDesc,
        style: context.font.headline6,
      ),
      actions: [
        Button(
          text: S.current.checkout,
          width: double.infinity,
          color: context.color.onPrimary,
          backgroundColor: context.color.primary,
          onPressed: () {
            /// 결제가 완료 되었다는 전제하에 항목 삭제하도록 구현
            cartService.deleteSelectedCartList();
            ToastHelper.show(S.current.checkoutDialogSucessToast);
            Navigator.pop(context);
          },
        ),
        const SizedBox(height: 12),
        Button(
          text: S.current.cancel,
          width: double.infinity,
          color: context.color.text,
          borderColor: context.color.hint,
          type: ButtonType.outline,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
