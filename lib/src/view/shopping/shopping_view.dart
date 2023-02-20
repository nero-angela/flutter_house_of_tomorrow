import 'package:flutter/material.dart';
import 'package:house_of_tomorrow/src/view/base_view.dart';
import 'package:house_of_tomorrow/src/view/shopping/shopping_view_model.dart';
import 'package:house_of_tomorrow/src/view/shopping/widget/product_card_grid.dart';
import 'package:house_of_tomorrow/src/view/shopping/widget/product_empty.dart';
import 'package:house_of_tomorrow/theme/component/bottom_sheet/setting_bottom_sheet.dart';
import 'package:house_of_tomorrow/theme/component/button/button.dart';
import 'package:house_of_tomorrow/theme/component/cart_button.dart';
import 'package:house_of_tomorrow/theme/component/hide_keyboard.dart';
import 'package:house_of_tomorrow/theme/component/input_field.dart';
import 'package:house_of_tomorrow/util/lang/generated/l10n.dart';

class ShoppingView extends StatefulWidget {
  const ShoppingView({super.key});

  @override
  State<ShoppingView> createState() => _ShoppingViewState();
}

class _ShoppingViewState extends State<ShoppingView> {
  @override
  void initState() {
    super.initState();
    // searchProductList();
  }

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: ShoppingViewModel(),
      builder: (context, viewModel) => HideKeyboard(
        child: Scaffold(
          appBar: AppBar(
            title: Text(S.current.shopping),
            actions: [
              /// 설정 버튼
              Button(
                icon: 'option',
                type: ButtonType.flat,
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (context) {
                      return const SettingBottomSheet();
                    },
                  );
                },
              ),

              /// 카트 버튼
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
                        onClear: viewModel.searchProductList,
                        onSubmitted: (text) => viewModel.searchProductList(),
                        hint: S.current.searchProduct,
                      ),
                    ),
                    const SizedBox(width: 16),

                    /// 검색 버튼
                    Button(
                      icon: 'search',
                      onPressed: viewModel.searchProductList,
                    ),
                  ],
                ),
              ),

              /// ProductCardList
              Expanded(
                child: viewModel.productList.isEmpty
                    ? const ProductEmpty()
                    : ProductCardGrid(viewModel.productList),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
