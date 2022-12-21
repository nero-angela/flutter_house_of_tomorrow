import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'package:tomorrow_house/helper/responsive_helper.dart';
import 'package:tomorrow_house/model/product.dart';
import 'package:tomorrow_house/service/theme_service.dart';
import 'package:tomorrow_house/view/base/base_view.dart';
import 'package:tomorrow_house/view/component/cart_button.dart';
import 'package:tomorrow_house/view/lang/generated/l10n.dart';
import 'package:tomorrow_house/view/page/shopping/shopping_page_model.dart';
import 'package:tomorrow_house/view/page/shopping/widget/product_card.dart';
import 'package:tomorrow_house/view/page/shopping/widget/setting_bottom_sheet.dart';
import 'package:tomorrow_house/view/theme/component/button.dart';
import 'package:tomorrow_house/view/theme/component/hide_keyboard.dart';
import 'package:tomorrow_house/view/theme/component/input_field.dart';

class ShoppingPage extends StatefulWidget {
  const ShoppingPage({super.key});

  @override
  State<ShoppingPage> createState() => _ShoppingPageState();
}

class _ShoppingPageState extends State<ShoppingPage> {
  late final ShoppingPageModel shoppingPageModel;

  @override
  void initState() {
    super.initState();
    shoppingPageModel = ShoppingPageModel(
      productRepository: context.read(),
    );
    shoppingPageModel.searchProductList();
  }

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: shoppingPageModel,
      builder: (context, viewModel) => HideKeyboard(
        child: Scaffold(
          appBar: AppBar(
            titleSpacing: 16,
            title: Text(
              S.current.shopping,
              style: context.font.headline2,
            ),
            actions: [
              Button(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return const SettingBottomSheet();
                    },
                  );
                },
                icon: 'option-outline.svg',
                type: ButtonType.flat,
              ),
              const CartButton(),
            ],
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: Row(
                  children: [
                    /// 검색
                    Expanded(
                      child: InputField(
                        controller: viewModel.textController,
                        hint: S.current.searchProduct,
                        onClear: viewModel.searchProductList,
                        onSubmitted: (text) => viewModel.searchProductList(),
                      ),
                    ),
                    const SizedBox(width: 16),

                    /// 검색 버튼
                    Button(
                      icon: 'search-outline.svg',
                      onPressed: viewModel.searchProductList,
                    ),
                  ],
                ),
              ),
              viewModel.productList.isEmpty

                  /// Empty
                  ? Expanded(
                      child: Center(
                        child: Text(
                          S.current.noProduct,
                          style: context.font.headline4.copyWith(
                            fontWeight: context.font.light,
                            color: context.color.inactive,
                          ),
                        ),
                      ),
                    )

                  /// ProductCard 목록
                  : Expanded(
                      child: MasonryGridView.count(
                        crossAxisCount: context.responsive(
                          2,
                          tablet: 3,
                          desktop: 4,
                        ),
                        mainAxisSpacing: 24,
                        crossAxisSpacing: 16,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 32,
                        ),
                        itemCount: viewModel.productList.length,
                        itemBuilder: (context, index) {
                          Product product = viewModel.productList[index];

                          /// ProductCard
                          return ProductCard(product: product);
                        },
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
