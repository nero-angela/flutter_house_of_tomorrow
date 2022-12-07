import 'package:flutter/material.dart';
import 'package:tomorrow_house/service/theme_service.dart';
import 'package:tomorrow_house/view/theme/component/asset_icon.dart';

class Tile extends StatelessWidget {
  const Tile({
    Key? key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onPressed,
  }) : super(key: key);

  final String icon;
  final String title;
  final String subtitle;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      behavior: HitTestBehavior.translucent,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            AssetIcon(
              icon,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                title,
                style: context.font.headline5,
              ),
            ),
            Text(
              subtitle,
              style: context.font.subtitle1.copyWith(
                color: context.color.primary,
              ),
            ),
            const SizedBox(width: 8),
            const AssetIcon('chevron-forward-outline.svg'),
          ],
        ),
      ),
    );
  }
}
