import 'package:flutter/material.dart';
import 'package:tomorrow_house/service/theme_service.dart';
import 'package:tomorrow_house/view/lang/generated/l10n.dart';
import 'package:tomorrow_house/view/page/shopping/widget/setting_bottom_sheet.dart';
import 'package:tomorrow_house/view/theme/component/button.dart';
import 'package:tomorrow_house/view/theme/component/input_field.dart';

class ShoppingPage extends StatelessWidget {
  const ShoppingPage({super.key});

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
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
