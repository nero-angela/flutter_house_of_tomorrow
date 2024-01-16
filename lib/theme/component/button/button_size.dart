part of 'button.dart';

/// 버튼 크기
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

  TextStyle getTextStyle(WidgetRef ref) {
    switch (this) {
      case ButtonSize.small:
        return ref.typo.subtitle2;
      case ButtonSize.medium:
        return ref.typo.subtitle1;
      case ButtonSize.large:
        return ref.typo.headline6;
    }
  }
}
