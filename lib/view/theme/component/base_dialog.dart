import 'package:flutter/material.dart';
import 'package:tomorrow_house/service/theme_service.dart';

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
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(16),
        ),
      ),
      titlePadding: const EdgeInsets.all(16),
      contentPadding: EdgeInsets.only(
        top: title != null ? 0 : 16,
        left: 16,
        right: 16,
        bottom: 16,
      ),
      actionsPadding: const EdgeInsets.all(16),
      title: title != null
          ? Text(
              title ?? '',
              style: context.font.headline2.copyWith(
                fontWeight: context.font.semiBold,
              ),
            )
          : null,
      content: content,
      actions: actions,
    );
  }
}
