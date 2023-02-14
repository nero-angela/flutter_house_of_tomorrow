part of 'app_theme.dart';

class AppColor {
  const AppColor({
    required this.surface,
    required this.background,
    required this.text,
    required this.subtext,
    required this.toastContainer,
    required this.onToastContainer,
    required this.hint,
    required this.hintContainer,
    required this.onHintContainer,
    required this.inactive,
    required this.inactiveContainer,
    required this.onInactiveContainer,
    required this.primary,
    required this.onPrimary,
    required this.secondary,
    required this.onSecondary,
    required this.tertiary,
    required this.onTertiary,
  });

  /// Surface
  final Color surface;
  final Color background;

  /// Toast
  final Color toastContainer;
  final Color onToastContainer;

  /// Text
  final Color text;
  final Color subtext;

  /// Hint
  final Color hint;
  final Color hintContainer;
  final Color onHintContainer;

  /// Inactive
  final Color inactive;
  final Color inactiveContainer;
  final Color onInactiveContainer;

  /// Accent
  final Color primary;
  final Color onPrimary;
  final Color secondary;
  final Color onSecondary;
  final Color tertiary;
  final Color onTertiary;
}
