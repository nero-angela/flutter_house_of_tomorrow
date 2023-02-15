import 'package:flutter/material.dart';
import 'package:house_of_tomorrow/src/service/theme_service.dart';
import 'package:house_of_tomorrow/theme/component/asset_icon.dart';

class Rating extends StatelessWidget {
  const Rating({
    super.key,
    required this.rating,
  });

  final String rating;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        AssetIcon(
          'star',
          color: context.color.tertiary,
          size: 20,
        ),
        const SizedBox(width: 6),
        Text(
          rating,
          style: context.typo.body1.copyWith(
            fontWeight: context.typo.light,
            color: context.color.subtext,
          ),
        ),
      ],
    );
  }
}
