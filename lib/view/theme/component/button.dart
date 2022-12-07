import 'package:flutter/material.dart';
import 'package:tomorrow_house/service/theme_service.dart';
import 'package:tomorrow_house/view/theme/component/asset_icon.dart';

enum ButtonType {
  fill,
  outline,
  flat;
}

enum ButtonSize {
  small,
  medium,
  large;

  double get padding {
    switch (this) {
      case ButtonSize.small:
        return 8;
      case ButtonSize.medium:
        return 12;
      case ButtonSize.large:
        return 16;
    }
  }

  TextStyle getTextStyle(BuildContext context) {
    switch (this) {
      case ButtonSize.small:
        return context.font.subtitle2;
      case ButtonSize.medium:
        return context.font.subtitle1;
      case ButtonSize.large:
        return context.font.headline6;
    }
  }
}

class Button extends StatefulWidget {
  const Button({
    super.key,
    required this.onPressed,
    this.text,
    this.icon,
    this.color,
    this.backgroundColor,
    this.borderColor,
    this.width,
    ButtonType? type,
    ButtonSize? size,
    bool? isInactive,
  })  : type = type ?? ButtonType.fill,
        size = size ?? ButtonSize.medium,
        isInactive = isInactive ?? false;

  final ButtonType type;
  final ButtonSize size;
  final bool isInactive;
  final void Function() onPressed;
  final String? text;
  final String? icon;
  final Color? color;
  final Color? backgroundColor;
  final Color? borderColor;
  final double? width;

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  bool isPressed = false;

  void onPressed(bool newIsPressed) {
    if (isPressed == newIsPressed) return;
    setState(() {
      isPressed = newIsPressed;
    });
  }

  @override
  Widget build(BuildContext context) {
    late final bool isInactive = isPressed || widget.isInactive;
    late final Color color;
    late final Color backgroundColor;
    late final BoxBorder? border;
    switch (widget.type) {
      case ButtonType.fill:
        color = isInactive
            ? context.color.onInactiveContainer
            : widget.color ?? context.color.onPrimary;
        backgroundColor = isInactive
            ? context.color.inactiveContainer
            : widget.backgroundColor ?? context.color.primary;
        border = null;
        break;
      case ButtonType.outline:
        color = isInactive
            ? context.color.inactive
            : widget.color ?? context.color.primary;
        backgroundColor = widget.backgroundColor ?? Colors.transparent;
        border = Border.all(color: widget.borderColor ?? color);
        break;
      case ButtonType.flat:
        color = isInactive
            ? context.color.inactive
            : widget.color ?? context.color.primary;
        backgroundColor = widget.backgroundColor ?? Colors.transparent;
        border = null;
        break;
    }

    return GestureDetector(
      onTapUp: (details) {
        onPressed(false);
        if (!widget.isInactive) {
          widget.onPressed();
        }
      },
      onTapDown: (details) => onPressed(true),
      onTapCancel: () => onPressed(true),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        width: widget.width,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(8),
          border: border,
        ),
        padding: EdgeInsets.all(widget.size.padding),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (widget.icon != null)
              AssetIcon(
                widget.icon!,
                color: color,
              ),
            if (widget.icon != null && widget.text != null)
              const SizedBox(width: 8),
            if (widget.text != null)
              Text(
                widget.text!,
                style: widget.size.getTextStyle(context).copyWith(
                      color: color,
                      fontWeight: context.font.semiBold,
                    ),
              ),
          ],
        ),
      ),
    );
  }
}
