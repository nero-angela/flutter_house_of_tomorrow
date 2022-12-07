import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:tomorrow_house/helper/network_helper.dart';
import 'package:tomorrow_house/model/product.dart';
import 'package:tomorrow_house/service/theme_service.dart';
import 'package:tomorrow_house/view/lang/generated/l10n.dart';
import 'package:tomorrow_house/view/page/shopping/widget/setting_bottom_sheet.dart';
import 'package:tomorrow_house/view/theme/component/button.dart';
import 'package:tomorrow_house/view/theme/component/input_field.dart';

class ShoppingPage extends StatefulWidget {
  const ShoppingPage({super.key});

  @override
  State<ShoppingPage> createState() => _ShoppingPageState();
}

class _ShoppingPageState extends State<ShoppingPage> {
  List<Product> productList = [];

  Future<void> searchProductList() async {
    try {
      final res = await NetworkHelper.dio.get(
        'https://gist.githubusercontent.com/nero-angela/d16a5078c7959bf5abf6a9e0f8c2851a/raw/04fb4d21ddd1ba06f0349a890f5e5347d94d677e/ikeaSofaDataIBB.json',
      );

      setState(() {
        productList = jsonDecode(res.data).map<Product>((json) {
          return Product.fromJson(json);
        }).toList();
      });
    } catch (e, s) {
      log('Failed to fetchProductList', error: e, stackTrace: s);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
          Button(
            onPressed: () {},
            icon: 'basket-outline.svg',
            type: ButtonType.flat,
          ),
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
                    hint: S.current.searchProduct,
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
        ],
      ),
    );
  }
}
