import 'package:flutter/material.dart';
import 'package:tomorrow_house/service/theme_service.dart';
import 'package:tomorrow_house/view/theme/component/button.dart';

class ArrowBackButton extends StatelessWidget {
  const ArrowBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Button(
      icon: 'arrow-back-outline.svg',
      color: context.color.text,
      type: ButtonType.flat,
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }
}
