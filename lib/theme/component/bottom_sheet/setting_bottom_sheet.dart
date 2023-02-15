import 'package:flutter/material.dart';
import 'package:house_of_tomorrow/theme/component/bottom_sheet/base_bottom_sheet.dart';

class SettingBottomSheet extends StatelessWidget {
  const SettingBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return const BaseBottomSheet(
      child: Text("hello bottom sheet"),
    );
  }
}
