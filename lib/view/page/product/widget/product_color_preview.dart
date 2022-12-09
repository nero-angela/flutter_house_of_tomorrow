import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_design_system/flutter_design_system.dart';
import 'package:tomorrow_house/helper/product_helper.dart';
import 'package:tomorrow_house/model/product.dart';

class ProductColorPreview extends StatelessWidget {
  const ProductColorPreview({
    super.key,
    required this.colorIndex,
    required this.product,
  });

  final int colorIndex;
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.color.surface,
        borderRadius: BorderRadius.circular(24),
        boxShadow: context.deco.shadow,
      ),
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Image
          AspectRatio(
            aspectRatio: 1 / 0.8,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: CachedNetworkImage(
                imageUrl: product.productColorList[colorIndex].imageUrl,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),

          const SizedBox(height: 16),

          /// Name
          Text(
            product.name.toString(),
            style: context.font.headline1.copyWith(
              fontWeight: context.font.semiBold,
            ),
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              /// Brand
              Text(
                product.brand.toString(),
                style: context.font.subtitle1.copyWith(
                  fontWeight: context.font.light,
                ),
              ),

              const Spacer(),

              /// Price
              Text(
                product.currency,
                style: context.font.headline6.copyWith(
                  color: context.color.primary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
