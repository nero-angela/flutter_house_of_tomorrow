import 'package:flutter/material.dart';
import 'package:tomorrow_house/helper/toast_helper.dart';
import 'package:tomorrow_house/service/cart_service.dart';
import 'package:tomorrow_house/service/theme_service.dart';
import 'package:tomorrow_house/view/lang/generated/l10n.dart';
import 'package:tomorrow_house/view/theme/component/base_dialog.dart';
import 'package:tomorrow_house/view/theme/component/button.dart';

class CartDeleteDialog extends StatelessWidget {
  const CartDeleteDialog({
    Key? key,
    required this.cartService,
  }) : super(key: key);

  final CartService cartService;

  @override
  Widget build(BuildContext context) {
    return BaseDialog(
      title: S.current.delete,
      content: Text(
        S.current.deleteDialogDesc,
        style: context.font.headline6,
      ),
      actions: [
        Button(
          text: S.current.delete,
          width: double.infinity,
          color: context.color.onSecondary,
          backgroundColor: context.color.secondary,
          onPressed: () {
            cartService.deleteSelectedCartList();
            ToastHelper.show(S.current.deleteDialogSuccessToast);
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
