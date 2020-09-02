import 'package:flutter/material.dart';

import 'core_pallete.dart';

class ThemePalatte {
  final Color background;
  final CorePalatte corePalatte;
  final bool themeType;
  ThemePalatte({
    @required this.background,
    @required this.themeType,
    this.corePalatte = const CorePalatte(
      buttonColor: Color(0xFF129E71),
    ),
  });
  static ThemePalatte get lightThemePalatte => ThemePalatte(
        background: const Color(0xFFFFFFFF),
        themeType: false,
      );
  static ThemePalatte get darkThemePalatte => ThemePalatte(
        background: const Color(0xFF0A1A1E),
        themeType: true,
      );
}
