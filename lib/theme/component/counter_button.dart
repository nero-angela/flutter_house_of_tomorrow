import 'package:flutter/material.dart';
import 'package:house_of_tomorrow/src/service/theme_service.dart';
import 'package:house_of_tomorrow/theme/component/asset_icon.dart';

class CounterButton extends StatelessWidget {
  const CounterButton({
    super.key,
    required this.count,
    required this.onChanged,
  });

  final int count;
  final void Function(int count) onChanged;

  @override
  Widget build(BuildContext context) {
    bool isMinusActive = count > 1;
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 16,
      children: [
        /// Minus
        GestureDetector(
          onTap: () {
            if (!isMinusActive) return;
            onChanged(count - 1);
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 222),
            decoration: BoxDecoration(
              color: context.color.surface,
              boxShadow: isMinusActive ? context.deco.shadow : null,
              borderRadius: BorderRadius.circular(99),
            ),
            padding: const EdgeInsets.all(8),
            child: AssetIcon(
              'minus',
              color: isMinusActive
                  ? context.color.primary
                  : context.color.inactive,
            ),
          ),
        ),

        /// Counter
        Text(
          '$count',
          style: context.typo.headline4.copyWith(
            fontWeight: context.typo.semiBold,
          ),
        ),

        /// Plus
        GestureDetector(
          onTap: () => onChanged(count + 1),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 222),
            decoration: BoxDecoration(
              color: context.color.surface,
              boxShadow: context.deco.shadow,
              borderRadius: BorderRadius.circular(99),
            ),
            padding: const EdgeInsets.all(8),
            child: AssetIcon(
              'plus',
              color: context.color.primary,
            ),
          ),
        ),
      ],
    );
  }
}
