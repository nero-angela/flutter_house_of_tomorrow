import 'package:flutter/material.dart';
import 'package:tomorrow_house/model/product.dart';
import 'package:tomorrow_house/view/page/product/widget/product_color_preview.dart';
import 'package:tomorrow_house/view/page/product/widget/product_desc.dart';
import 'package:tomorrow_house/view/theme/component/color_picker.dart';

class ProductInfo extends StatelessWidget {
  const ProductInfo({
    super.key,
    required this.colorIndex,
    required this.product,
    required this.onColorSelected,
  });

  final int colorIndex;
  final Product product;
  final void Function(int index) onColorSelected;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 32),
      child: Column(
        children: [
          /// 제품 색상 이미지
          ProductColorPreview(
            colorIndex: colorIndex,
            product: product,
          ),

          const SizedBox(height: 32),

          /// 제품 색상
          ColorPicker(
            colorIndex: colorIndex,
            colorList: product.productColorList.map<Color>(
              (productColor) {
                return productColor.color;
              },
            ).toList(),
            onSelected: onColorSelected,
          ),

          const SizedBox(height: 32),

          /// 제품 설명
          ProductDesc(product: product),
        ],
      ),
    );
  }
}
