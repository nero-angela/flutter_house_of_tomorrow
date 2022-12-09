import 'package:flutter/material.dart';
import 'package:flutter_design_system/flutter_design_system.dart';

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
