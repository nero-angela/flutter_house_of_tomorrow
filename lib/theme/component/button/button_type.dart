part of 'button.dart';

/// 버튼 타입
enum ButtonType {
  fill,
  flat,
  outline;

  /// 텍스트 & 아이콘 색상
  Color getColor(
    WidgetRef ref,
    bool isInactive, [
    Color? color,
  ]) {
    switch (this) {
      case ButtonType.fill:
        return isInactive
            ? ref.color.onInactiveContainer
            : color ?? ref.color.onPrimary;
      case ButtonType.flat:
      case ButtonType.outline:
        return isInactive ? ref.color.inactive : color ?? ref.color.primary;
    }
  }

  /// 배경 색상
  Color getBackgroundColor(
    WidgetRef ref,
    bool isInactive, [
    Color? color,
  ]) {
    switch (this) {
      case ButtonType.fill:
        return isInactive
            ? ref.color.inactiveContainer
            : color ?? ref.color.primary;
      case ButtonType.flat:
      case ButtonType.outline:
        return color ?? Colors.transparent;
    }
  }

  /// 테두리
  Border? getBorder(
    WidgetRef ref,
    bool isInactive, [
    Color? color,
  ]) {
    switch (this) {
      case ButtonType.fill:
      case ButtonType.flat:
        return null;
      case ButtonType.outline:
        return Border.all(
          color: getColor(ref, isInactive, color),
        );
    }
  }
}
