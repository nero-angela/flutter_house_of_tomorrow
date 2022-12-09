import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_design_system/flutter_design_system.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:tomorrow_house/helper/network_helper.dart';
import 'package:tomorrow_house/model/product.dart';
import 'package:tomorrow_house/view/component/cart_button.dart';
import 'package:tomorrow_house/view/lang/generated/l10n.dart';
import 'package:tomorrow_house/view/page/shopping/widget/product_card.dart';
import 'package:tomorrow_house/view/page/shopping/widget/setting_bottom_sheet.dart';

class ShoppingPage extends StatefulWidget {
  const ShoppingPage({super.key});

  @override
  State<ShoppingPage> createState() => _ShoppingPageState();
}

class _ShoppingPageState extends State<ShoppingPage> {
  List<Product> productList = [];
  final TextEditingController textController = TextEditingController();
  String get keyword => textController.text.trim();

  @override
  void initState() {
    super.initState();
    searchProductList();
  }

  Future<void> searchProductList() async {
    try {
      final res = await NetworkHelper.dio.get(
        'https://gist.githubusercontent.com/nero-angela/d16a5078c7959bf5abf6a9e0f8c2851a/raw/04fb4d21ddd1ba06f0349a890f5e5347d94d677e/ikeaSofaDataIBB.json',
      );

      setState(() {
        productList = jsonDecode(res.data).map<Product>((json) {
          return Product.fromJson(json);
        }).where((product) {
          /// 키워드가 비어있는 경우 모두 반환
          if (keyword.isEmpty) return true;

          /// name이나 brand에 키워드 포함 여부 확인
          return "${product.name}${product.brand}"
              .toLowerCase()
              .contains(keyword.toLowerCase());
        }).toList();
      });
    } catch (e, s) {
      log('Failed to fetchProductList', error: e, stackTrace: s);
    }
  }

  @override
  Widget build(BuildContext context) {
    return HideKeyboard(
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
                      controller: textController,
                      hint: S.current.searchProduct,
                      onClear: searchProductList,
                      onSubmitted: (text) => searchProductList(),
                    ),
                  ),
                  const SizedBox(width: 16),

                  /// 검색 버튼
                  Button(
                    icon: 'search-outline.svg',
                    onPressed: searchProductList,
                  ),
                ],
              ),
            ),
            productList.isEmpty

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
                      itemCount: productList.length,
                      itemBuilder: (context, index) {
                        Product product = productList[index];

                        /// ProductCard
                        return ProductCard(product: product);
                      },
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
