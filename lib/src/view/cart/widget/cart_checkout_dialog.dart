import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:house_of_tomorrow/src/service/theme_service.dart';
import 'package:house_of_tomorrow/theme/component/base_dialog.dart';
import 'package:house_of_tomorrow/theme/component/button/button.dart';
import 'package:house_of_tomorrow/util/lang/generated/l10n.dart';

class CartCheckoutDialog extends ConsumerWidget {
  const CartCheckoutDialog({
    Key? key,
    required this.onCheckoutPressed,
  }) : super(key: key);

  final void Function() onCheckoutPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BaseDialog(
      title: S.current.checkout,
      content: Text(
        S.current.checkoutDialogDesc,
        style: ref.typo.headline6,
      ),
      actions: [
        /// Checkout
        Button(
          text: S.current.checkout,
          width: double.infinity,
          color: ref.color.onPrimary,
          backgroundColor: ref.color.primary,
          onPressed: () {
            Navigator.pop(context);
            onCheckoutPressed();
          },
        ),
        const SizedBox(height: 12),

        /// Cancel
        Button(
          text: S.current.cancel,
          width: double.infinity,
          color: ref.color.text,
          borderColor: ref.color.hint,
          type: ButtonType.outline,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
