import 'package:flutter/material.dart';
import 'package:tomorrow_house/helper/responsive_helper.dart';
import 'package:tomorrow_house/model/product.dart';
import 'package:tomorrow_house/view/base/base_view.dart';
import 'package:tomorrow_house/view/component/arrow_back_button.dart';
import 'package:tomorrow_house/view/component/cart_button.dart';
import 'package:tomorrow_house/view/lang/generated/l10n.dart';
import 'package:tomorrow_house/view/page/product/product_page_model.dart';
import 'package:tomorrow_house/view/page/product/widget/product_bottom_sheet.dart';
import 'package:tomorrow_house/view/page/product/widget/product_info.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: ProductPageModel(product: product),
      builder: (context, viewModel) => Scaffold(
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
                child: buildProductInfo(viewModel),
              ),
              buildProductBottomSheet(viewModel),
            ],
          ),

          /// Desktop
          desktop: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(width: 16),
              Expanded(
                flex: 2,
                child: buildProductInfo(viewModel),
              ),
              const SizedBox(width: 16),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(top: 32),
                  child: buildProductBottomSheet(viewModel),
                ),
              ),
              const SizedBox(width: 16),
            ],
          ),
        ),
      ),
    );
  }

  ProductBottomSheet buildProductBottomSheet(ProductPageModel viewModel) {
    return ProductBottomSheet(
      product: viewModel.product,
      colorIndex: viewModel.colorIndex,
      count: viewModel.totalCount,
      onCountChanged: (count) {
        viewModel.totalCount = count;
      },
    );
  }

  ProductInfo buildProductInfo(ProductPageModel viewModel) {
    return ProductInfo(
      colorIndex: viewModel.colorIndex,
      product: viewModel.product,
      onColorSelected: (index) {
        viewModel.colorIndex = index;
      },
    );
  }
}
