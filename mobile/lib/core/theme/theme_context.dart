import 'package:flutter/material.dart';
import 'package:mobile/core/theme/app_color_extension.dart';

extension ThemeContext on BuildContext {
  ColorScheme get colors => Theme.of(this).colorScheme;

  TextTheme get text => Theme.of(this).textTheme;

  AppColors get appColors => Theme.of(this).extension<AppColors>()!;
}
