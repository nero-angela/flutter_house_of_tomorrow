import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:house_of_tomorrow/src/service/lang_service.dart';
import 'package:house_of_tomorrow/src/service/theme_service.dart';
import 'package:house_of_tomorrow/theme/component/bottom_sheet/base_bottom_sheet.dart';
import 'package:house_of_tomorrow/theme/component/tile.dart';
import 'package:house_of_tomorrow/util/helper/intl_helper.dart';
import 'package:house_of_tomorrow/util/lang/generated/l10n.dart';

class SettingBottomSheet extends ConsumerWidget {
  const SettingBottomSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isLightTheme = ref.theme.brightness == Brightness.light;
    return BaseBottomSheet(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          /// Theme Tile
          Tile(
            icon: isLightTheme ? 'sunny' : 'moon',
            title: S.current.theme,
            subtitle: isLightTheme ? S.current.light : S.current.dark,
            onPressed: ref.read(themeServiceProvider.notifier).toggleTheme,
          ),

          /// Lang Tile
          Tile(
            icon: 'language',
            title: S.current.language,
            subtitle: ref.watch(langServiceProvider) == IntlHelper.ko
                ? S.current.ko
                : S.current.en,
            onPressed: ref.read(langServiceProvider.notifier).toggleLang,
          ),
        ],
      ),
    );
  }
}
