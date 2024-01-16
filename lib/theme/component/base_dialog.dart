import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:house_of_tomorrow/src/service/theme_service.dart';

class BaseDialog extends ConsumerWidget {
  const BaseDialog({
    super.key,
    this.title,
    this.content,
    this.actions,
  });

  final String? title;
  final Widget? content;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context,  WidgetRef ref) {
    return AlertDialog(
      backgroundColor: ref.color.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      titlePadding: const EdgeInsets.all(16),
      contentPadding: const EdgeInsets.all(16).copyWith(
        top: title != null ? 0 : 16,
      ),
      actionsPadding: const EdgeInsets.all(16),
      title: title != null
          ? Text(
              title!,
              style: ref.typo.headline2.copyWith(
                fontWeight: ref.typo.semiBold,
              ),
            )
          : null,
      content: content,
      actions: actions,
    );
  }
}
