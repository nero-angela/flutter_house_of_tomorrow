import 'package:flutter/material.dart';
import 'package:tomorrow_house/model/product.dart';
import 'package:tomorrow_house/view/component/arrow_back_button.dart';
import 'package:tomorrow_house/view/lang/generated/l10n.dart';
import 'package:tomorrow_house/view/page/product/widget/product_color_preview.dart';
import 'package:tomorrow_house/view/theme/component/color_picker.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  /// 선택된 색상 index
  int colorIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.current.product),
        leading: const ArrowBackButton(),
      ),
      body: Column(
        children: [
          /// 제품 색상 이미지
          ProductColorPreview(
            colorIndex: colorIndex,
            product: widget.product,
          ),

          const SizedBox(height: 32),

          /// 제품 색상
          ColorPicker(
            colorIndex: colorIndex,
            colorList: widget.product.productColorList.map<Color>(
              (productColor) {
                return productColor.color;
              },
            ).toList(),
            onSelected: (index) {
              setState(() {
                colorIndex = index;
              });
            },
          ),
        ],
      ),
    );
  }
}
