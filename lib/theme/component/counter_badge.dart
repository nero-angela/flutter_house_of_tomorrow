import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:house_of_tomorrow/src/service/theme_service.dart';

class CounterBadge extends ConsumerWidget {
  const CounterBadge({
    super.key,
    required this.child,
    required this.label,
    required this.isShow,
  });

  final Widget child;
  final String label;
  final bool isShow;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
              backgroundColor: ref.color.secondary,
              radius: isShow ? 10 : 0,
              child: Text(
                label,
                style: ref.typo.body2.copyWith(
                  color: ref.color.onSecondary,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
