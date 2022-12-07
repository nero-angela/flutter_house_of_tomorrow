import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tomorrow_house/helper/intl_helper.dart';
import 'package:tomorrow_house/service/theme_service.dart';
import 'package:tomorrow_house/view/lang/generated/l10n.dart';
import 'package:tomorrow_house/view/theme/component/base_bottom_sheet.dart';
import 'package:tomorrow_house/view/theme/component/tile.dart';

class SettingBottomSheet extends StatelessWidget {
  const SettingBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseBottomSheet(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          /// Theme(테마)
          Tile(
            icon: 'sunny-outline.svg',
            title: S.current.theme,
            subtitle: context.theme.brightness == Brightness.light
                ? S.current.light
                : S.current.dark,
            onPressed: () {
              context.read<ThemeService>().toggleTheme();
            },
          ),

          /// Language(언어)
          Tile(
            icon: 'language-outline.svg',
            title: S.current.language,
            subtitle: IntlHelper.isKo ? S.current.ko : S.current.en,
            onPressed: () {
              context.read<ThemeService>().toggleLang();
            },
          ),
        ],
      ),
    );
  }
}
