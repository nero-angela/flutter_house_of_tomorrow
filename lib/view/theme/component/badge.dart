import 'package:flutter/material.dart';
import 'package:tomorrow_house/service/theme_service.dart';

class Badge extends StatelessWidget {
  const Badge({
    super.key,
    required this.child,
    required this.label,
    required this.isShow,
  });

  final Widget child;
  final String label;
  final bool isShow;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        /// Child Widget
        child,

        /// Badge
        Positioned(
          top: 10,
          right: 6,
          child: IgnorePointer(
            ignoring: true,
            child: CircleAvatar(
              backgroundColor: context.color.secondary,
              radius: isShow ? 10 : 0,
              child: Text(
                label,
                style: context.font.body2.copyWith(
                  fontWeight: context.font.light,
                  color: context.color.onSecondary,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
