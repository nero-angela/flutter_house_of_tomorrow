import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tomorrow_house/helper/product_helper.dart';
import 'package:tomorrow_house/model/product.dart';
import 'package:tomorrow_house/route_path.dart';
import 'package:tomorrow_house/service/theme_service.dart';
import 'package:tomorrow_house/view/theme/component/asset_icon.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          RoutePath.product,
          arguments: product,
        );
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: context.color.surface,
          boxShadow: context.deco.shadow,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Image
            if (product.productColorList.isNotEmpty)
              AspectRatio(
                aspectRatio: 1 / 1,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: CachedNetworkImage(
                    imageUrl: product.productColorList.first.imageUrl,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            const SizedBox(height: 4),

            /// Name
            Text(
              product.name.toString(),
              style: context.font.headline4.copyWith(
                fontWeight: context.font.semiBold,
              ),
            ),
            const SizedBox(height: 4),

            /// Brand
            Text(
              product.brand.toString(),
              style: context.font.body2.copyWith(
                fontWeight: context.font.light,
              ),
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                /// Price
                Expanded(
                  child: Text(
                    product.currency,
                    style: context.font.subtitle2,
                  ),
                ),

                /// Rating
                AssetIcon(
                  'star-fill.svg',
                  color: context.color.tertiary,
                  size: 20,
                ),
                Text(
                  product.rating,
                  style: context.font.body1.copyWith(
                    fontWeight: context.font.light,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
