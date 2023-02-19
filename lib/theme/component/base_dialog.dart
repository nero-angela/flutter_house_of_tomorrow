import 'package:flutter/material.dart';
import 'package:house_of_tomorrow/src/service/theme_service.dart';

class BaseDialog extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: context.color.surface,
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
              style: context.typo.headline2.copyWith(
                fontWeight: context.typo.semiBold,
              ),
            )
          : null,
      content: content,
      actions: actions,
    );
  }
}
