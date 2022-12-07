import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tomorrow_house/service/theme_service.dart';

class AssetIcon extends StatelessWidget {
  const AssetIcon(
    this.icon, {
    super.key,
    this.color,
    this.size,
  });

  final String icon;
  final Color? color;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'asset/icon/$icon',
      width: size,
      height: size,
      color: color ?? context.color.text,
    );
  }
}
