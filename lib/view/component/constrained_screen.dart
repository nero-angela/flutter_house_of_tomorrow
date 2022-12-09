import 'package:flutter/material.dart';
import 'package:flutter_design_system/flutter_design_system.dart';

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
