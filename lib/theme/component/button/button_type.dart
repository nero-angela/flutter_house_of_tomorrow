part of 'button.dart';

/// 버튼 타입
enum ButtonType {
  fill,
  flat,
  outline;

  /// 텍스트 & 아이콘 색상
  Color getColor(
    BuildContext context,
    bool isInactive, [
    Color? color,
  ]) {
    switch (this) {
      case ButtonType.fill:
        return isInactive
            ? context.color.onInactiveContainer
            : color ?? context.color.onPrimary;
      case ButtonType.flat:
      case ButtonType.outline:
        return isInactive
            ? context.color.inactive
            : color ?? context.color.primary;
    }
  }

  /// 배경 색상
  Color getBackgroundColor(
    BuildContext context,
    bool isInactive, [
    Color? color,
  ]) {
    switch (this) {
      case ButtonType.fill:
        return isInactive
            ? context.color.inactiveContainer
            : color ?? context.color.primary;
      case ButtonType.flat:
      case ButtonType.outline:
        return color ?? Colors.transparent;
    }
  }

  /// 테두리
  Border? getBorder(
    BuildContext context,
    bool isInactive, [
    Color? color,
  ]) {
    switch (this) {
      case ButtonType.fill:
      case ButtonType.flat:
        return null;
      case ButtonType.outline:
        return Border.all(
          color: getColor(context, isInactive, color),
        );
    }
  }
}
