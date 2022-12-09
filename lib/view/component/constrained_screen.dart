import 'package:flutter/material.dart';
import 'package:tomorrow_house/helper/responsive_helper.dart';
import 'package:tomorrow_house/service/theme_service.dart';

class ConstrainedScreen extends StatelessWidget {
  const ConstrainedScreen({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.color.surface,
      alignment: Alignment.center,
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: ResponsiveConfig.desktopMaxWidth,
        ),
        child: child,
      ),
    );
  }
}
