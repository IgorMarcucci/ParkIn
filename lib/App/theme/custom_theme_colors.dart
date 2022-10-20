import 'package:flutter/material.dart';

class CustomThemeColors extends ThemeExtension<CustomThemeColors> {
  final Color? dividerColor;

  CustomThemeColors({
    this.dividerColor,
  });

  @override
  ThemeExtension<CustomThemeColors> copyWith({
    Color? dividerColor,
  }) {
    return CustomThemeColors(
      dividerColor: dividerColor ?? this.dividerColor,
    );
  }

  @override
  ThemeExtension<CustomThemeColors> lerp(
      ThemeExtension<CustomThemeColors>? other, double t) {
    if (other is! CustomThemeColors) {
      return this;
    }

    return CustomThemeColors(
      dividerColor: Color.lerp(dividerColor, other.dividerColor, t),
    );
  }
}