import 'package:flutter/material.dart';
import 'package:mobile/core/theme/app_colors.dart';

@immutable
class AppColors extends ThemeExtension<AppColors> {
  const AppColors({
    required this.primaryDark,
    required this.primaryLight,
    required this.surfaceVariant,
    required this.textDisabled,
    required this.border,
    required this.borderFocus,
    required this.success,
    required this.warning,
    required this.error,
  });

  final Color primaryDark;
  final Color primaryLight;
  final Color surfaceVariant;
  final Color textDisabled;
  final Color border;
  final Color borderFocus;
  final Color success;
  final Color warning;
  final Color error;

  static const light = AppColors(
    primaryDark: AppPalette.primaryDark,
    primaryLight: AppPalette.primaryLight,
    surfaceVariant: AppPalette.surfaceVariant,
    textDisabled: AppPalette.textDisabled,
    border: AppPalette.border,
    borderFocus: AppPalette.borderFocus,
    success: AppPalette.success,
    warning: AppPalette.warning,
    error: AppPalette.error,
  );

  static const dark = AppColors(
    primaryDark: AppPalette.primaryDarkDarkTheme,
    primaryLight: AppPalette.primaryLightDarkTheme,
    surfaceVariant: AppPalette.surfaceVariantDarkTheme,
    textDisabled: AppPalette.textDisabledDarkTheme,
    border: AppPalette.borderDarkTheme,
    borderFocus: AppPalette.borderFocusDarkTheme,
    success: AppPalette.successDarkTheme,
    warning: AppPalette.warningDarkTheme,
    error: AppPalette.errorDarkTheme,
  );

  @override
  AppColors copyWith({
    Color? primaryDark,
    Color? primaryLight,
    Color? surfaceVariant,
    Color? textDisabled,
    Color? border,
    Color? borderFocus,
    Color? success,
    Color? warning,
    Color? error,
  }) {
    return AppColors(
      primaryDark: primaryDark ?? this.primaryDark,
      primaryLight: primaryLight ?? this.primaryLight,
      surfaceVariant: surfaceVariant ?? this.surfaceVariant,
      textDisabled: textDisabled ?? this.textDisabled,
      border: border ?? this.border,
      borderFocus: borderFocus ?? this.borderFocus,
      success: success ?? this.success,
      warning: warning ?? this.warning,
      error: error ?? this.error,
    );
  }

  @override
  AppColors lerp(AppColors? other, double t) {
    if (other is! AppColors) {
      return this;
    }

    return AppColors(
      primaryDark: Color.lerp(primaryDark, other.primaryDark, t)!,
      primaryLight: Color.lerp(primaryLight, other.primaryLight, t)!,
      surfaceVariant: Color.lerp(surfaceVariant, other.surfaceVariant, t)!,
      textDisabled: Color.lerp(textDisabled, other.textDisabled, t)!,
      border: Color.lerp(border, other.border, t)!,
      borderFocus: Color.lerp(borderFocus, other.borderFocus, t)!,
      success: Color.lerp(success, other.success, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
      error: Color.lerp(error, other.error, t)!,
    );
  }
}
