import 'package:flutter/material.dart';
import 'package:tomorrow_house/helper/responsive_helper.dart';
import 'package:tomorrow_house/model/product.dart';
import 'package:tomorrow_house/view/component/arrow_back_button.dart';
import 'package:tomorrow_house/view/component/cart_button.dart';
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
        actions: const [
          CartButton(),
        ],
      ),
      body: context.responsive(
        /// Mobile & Tablet
        Column(
          children: [
            Expanded(
              child: buildProductInfo(),
            ),
            buildProductBottomSheet(),
          ],
        ),

        /// Desktop
        desktop: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(width: 16),
            Expanded(
              flex: 2,
              child: buildProductInfo(),
            ),
            const SizedBox(width: 16),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(top: 32),
                child: buildProductBottomSheet(),
              ),
            ),
            const SizedBox(width: 16),
          ],
        ),
      ),
    );
  }

  ProductBottomSheet buildProductBottomSheet() {
    return ProductBottomSheet(
      product: widget.product,
      colorIndex: colorIndex,
      count: totalCount,
      onCountChanged: (count) {
        setState(() {
          totalCount = count;
        });
      },
    );
  }

  ProductInfo buildProductInfo() {
    return ProductInfo(
      colorIndex: colorIndex,
      product: widget.product,
      onColorSelected: (index) {
        setState(() {
          colorIndex = index;
        });
      },
    );
  }
}
