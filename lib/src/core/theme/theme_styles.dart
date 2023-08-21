import 'package:flutter/material.dart';

import 'package:rickandmorty_app/src/core/theme/enums/theme_type.dart';

sealed class ThemeStyles {
  static Color backgroundColor({
    required BuildContext context,
    required ThemeType type,
  }) {
    switch (type) {
      case ThemeType.primary:
        return Theme.of(context).colorScheme.primary;
      case ThemeType.secondary:
        return Theme.of(context).colorScheme.secondary;
      case ThemeType.tertiary:
        return Theme.of(context).colorScheme.tertiary;
      case ThemeType.error:
        return Theme.of(context).colorScheme.error;
      default:
        return Theme.of(context).colorScheme.background;
    }
  }

  static Color textColor({
    required BuildContext context,
    required ThemeType type,
  }) {
    switch (type) {
      case ThemeType.primary:
        return Theme.of(context).colorScheme.onPrimary;
      case ThemeType.secondary:
        return Theme.of(context).colorScheme.onSecondary;
      case ThemeType.tertiary:
        return Theme.of(context).colorScheme.onTertiary;
      case ThemeType.error:
        return Theme.of(context).colorScheme.onError;
      default:
        return Theme.of(context).colorScheme.onBackground;
    }
  }
}
