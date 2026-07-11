import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile/core/theme/app_color_extension.dart';
import 'package:mobile/core/theme/app_colors.dart';

const _borderRadius = BorderRadius.all(Radius.circular(12));
const _snackBarBorderRadius = BorderRadius.all(Radius.circular(8));

ThemeData buildLightTheme() {
  const appColors = AppColors.light;

  const colorScheme = ColorScheme.light(
    primary: AppPalette.primary,
    onPrimary: AppPalette.onPrimary,
    primaryContainer: AppPalette.primaryLight,
    onPrimaryContainer: AppPalette.primaryDark,
    secondary: AppPalette.accent,
    onSecondary: AppPalette.onSecondary,
    surface: AppPalette.surface,
    onSurface: AppPalette.textPrimary,
    onSurfaceVariant: AppPalette.textSecondary,
    surfaceContainerLow: AppPalette.surfaceVariant,
    outline: AppPalette.border,
    error: AppPalette.error,
    onError: AppPalette.onError,
  );

  final textTheme = _buildTextTheme(
    base: ThemeData.light(useMaterial3: true).textTheme,
    onSurface: colorScheme.onSurface,
    onSurfaceVariant: colorScheme.onSurfaceVariant,
  );

  return ThemeData(
    useMaterial3: true,
    colorScheme: colorScheme,
    scaffoldBackgroundColor: AppPalette.background,
    textTheme: textTheme,
    extensions: const [appColors],
    appBarTheme: AppBarTheme(
      backgroundColor: colorScheme.surface,
      foregroundColor: colorScheme.onSurface,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: textTheme.titleLarge?.copyWith(
        color: colorScheme.onSurface,
        fontWeight: FontWeight.w600,
      ),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: _filledButtonStyle(colorScheme, appColors),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: colorScheme.secondary,
        textStyle: textTheme.labelLarge,
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: colorScheme.primary,
        side: BorderSide(color: appColors.border),
        minimumSize: const Size(double.infinity, 48),
        shape: const RoundedRectangleBorder(borderRadius: _borderRadius),
        textStyle: textTheme.labelLarge,
      ),
    ),
    inputDecorationTheme: _inputDecorationTheme(
      colorScheme: colorScheme,
      appColors: appColors,
      fillColor: colorScheme.surface,
    ),
    snackBarTheme: SnackBarThemeData(
      backgroundColor: colorScheme.onSurface,
      contentTextStyle: textTheme.bodyMedium?.copyWith(
        color: colorScheme.surface,
      ),
      behavior: SnackBarBehavior.floating,
      shape: const RoundedRectangleBorder(
        borderRadius: _snackBarBorderRadius,
      ),
    ),
    cardTheme: CardThemeData(
      color: colorScheme.surface,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: _borderRadius,
        side: BorderSide(color: appColors.border),
      ),
    ),
    dividerTheme: DividerThemeData(
      color: appColors.border,
      thickness: 1,
      space: 1,
    ),
  );
}

ThemeData buildDarkTheme() {
  const appColors = AppColors.dark;

  const colorScheme = ColorScheme.dark(
    primary: AppPalette.primaryDarkTheme,
    onPrimary: AppPalette.onPrimaryDarkTheme,
    primaryContainer: AppPalette.primaryLightDarkTheme,
    onPrimaryContainer: AppPalette.primaryDarkDarkTheme,
    secondary: AppPalette.accentDarkTheme,
    onSecondary: AppPalette.onSecondaryDarkTheme,
    surface: AppPalette.surfaceDarkTheme,
    onSurface: AppPalette.textPrimaryDarkTheme,
    onSurfaceVariant: AppPalette.textSecondaryDarkTheme,
    surfaceContainerLow: AppPalette.surfaceVariantDarkTheme,
    outline: AppPalette.borderDarkTheme,
    error: AppPalette.errorDarkTheme,
    onError: AppPalette.onErrorDarkTheme,
  );

  final textTheme = _buildTextTheme(
    base: ThemeData.dark(useMaterial3: true).textTheme,
    onSurface: colorScheme.onSurface,
    onSurfaceVariant: colorScheme.onSurfaceVariant,
  );

  return ThemeData(
    useMaterial3: true,
    colorScheme: colorScheme,
    scaffoldBackgroundColor: AppPalette.backgroundDarkTheme,
    textTheme: textTheme,
    extensions: const [appColors],
    appBarTheme: AppBarTheme(
      backgroundColor: colorScheme.surface,
      foregroundColor: colorScheme.onSurface,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: textTheme.titleLarge?.copyWith(
        color: colorScheme.onSurface,
        fontWeight: FontWeight.w600,
      ),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: _filledButtonStyle(colorScheme, appColors),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: colorScheme.secondary,
        textStyle: textTheme.labelLarge,
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: colorScheme.primary,
        side: BorderSide(color: appColors.border),
        minimumSize: const Size(double.infinity, 48),
        shape: const RoundedRectangleBorder(borderRadius: _borderRadius),
        textStyle: textTheme.labelLarge,
      ),
    ),
    inputDecorationTheme: _inputDecorationTheme(
      colorScheme: colorScheme,
      appColors: appColors,
      fillColor: appColors.surfaceVariant,
    ),
    snackBarTheme: SnackBarThemeData(
      backgroundColor: colorScheme.onSurface,
      contentTextStyle: textTheme.bodyMedium?.copyWith(
        color: colorScheme.surface,
      ),
      behavior: SnackBarBehavior.floating,
      shape: const RoundedRectangleBorder(
        borderRadius: _snackBarBorderRadius,
      ),
    ),
    cardTheme: CardThemeData(
      color: colorScheme.surface,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: _borderRadius,
        side: BorderSide(color: appColors.border),
      ),
    ),
    dividerTheme: DividerThemeData(
      color: appColors.border,
      thickness: 1,
      space: 1,
    ),
  );
}

TextTheme _buildTextTheme({
  required TextTheme base,
  required Color onSurface,
  required Color onSurfaceVariant,
}) {
  final jakarta = GoogleFonts.plusJakartaSansTextTheme(base);

  return jakarta.copyWith(
    displayLarge: jakarta.displayLarge?.copyWith(color: onSurface),
    displayMedium: jakarta.displayMedium?.copyWith(color: onSurface),
    displaySmall: jakarta.displaySmall?.copyWith(color: onSurface),
    headlineLarge: jakarta.headlineLarge?.copyWith(color: onSurface),
    headlineMedium: jakarta.headlineMedium?.copyWith(color: onSurface),
    headlineSmall: jakarta.headlineSmall?.copyWith(color: onSurface),
    titleLarge: jakarta.titleLarge?.copyWith(color: onSurface),
    titleMedium: jakarta.titleMedium?.copyWith(color: onSurface),
    titleSmall: jakarta.titleSmall?.copyWith(color: onSurface),
    bodyLarge: jakarta.bodyLarge?.copyWith(color: onSurface),
    bodyMedium: jakarta.bodyMedium?.copyWith(color: onSurfaceVariant),
    bodySmall: jakarta.bodySmall?.copyWith(color: onSurfaceVariant),
    labelLarge: jakarta.labelLarge?.copyWith(color: onSurface),
    labelMedium: jakarta.labelMedium?.copyWith(color: onSurfaceVariant),
    labelSmall: jakarta.labelSmall?.copyWith(color: onSurfaceVariant),
  );
}

ButtonStyle _filledButtonStyle(ColorScheme colorScheme, AppColors appColors) {
  return FilledButton.styleFrom(
    backgroundColor: colorScheme.primary,
    foregroundColor: colorScheme.onPrimary,
    minimumSize: const Size(double.infinity, 48),
    shape: const RoundedRectangleBorder(borderRadius: _borderRadius),
  ).copyWith(
    backgroundColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.disabled)) {
        return colorScheme.primary.withValues(alpha: 0.38);
      }
      if (states.contains(WidgetState.pressed)) {
        return appColors.primaryDark;
      }
      return colorScheme.primary;
    }),
    foregroundColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.disabled)) {
        return colorScheme.onPrimary.withValues(alpha: 0.38);
      }
      return colorScheme.onPrimary;
    }),
  );
}

InputDecorationTheme _inputDecorationTheme({
  required ColorScheme colorScheme,
  required AppColors appColors,
  required Color fillColor,
}) {
  OutlineInputBorder border(Color color, {double width = 1}) {
    return OutlineInputBorder(
      borderRadius: _borderRadius,
      borderSide: BorderSide(color: color, width: width),
    );
  }

  return InputDecorationTheme(
    filled: true,
    fillColor: fillColor,
    labelStyle: TextStyle(color: colorScheme.onSurfaceVariant),
    hintStyle: TextStyle(color: appColors.textDisabled),
    errorStyle: TextStyle(color: appColors.error),
    border: border(appColors.border),
    enabledBorder: border(appColors.border),
    focusedBorder: border(appColors.borderFocus, width: 2),
    errorBorder: border(appColors.error),
    focusedErrorBorder: border(appColors.error, width: 2),
  );
}
