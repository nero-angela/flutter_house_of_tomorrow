import 'package:flutter/material.dart';
import 'package:tomorrow_house/model/product.dart';
import 'package:tomorrow_house/view/component/arrow_back_button.dart';
import 'package:tomorrow_house/view/lang/generated/l10n.dart';
import 'package:tomorrow_house/view/page/product/widget/product_bottom_sheet.dart';
import 'package:tomorrow_house/view/page/product/widget/product_info.dart';

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

  /// 수량
  int totalCount = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.current.product),
        leading: const ArrowBackButton(),
      ),
      body: Column(
        children: [
          Expanded(
            child: ProductInfo(
              colorIndex: colorIndex,
              product: widget.product,
              onColorSelected: (index) {
                setState(() {
                  colorIndex = index;
                });
              },
            ),
          ),
          ProductBottomSheet(
            product: widget.product,
            colorIndex: colorIndex,
            count: totalCount,
            onCountChanged: (count) {
              setState(() {
                totalCount = count;
              });
            },
          ),
        ],
      ),
    );
  }
}
