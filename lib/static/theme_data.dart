import 'dart:ui';

import 'package:flutter/material.dart';

class CustomTheme {
  static final Color primary = const Color(0xFFED847D);
  static final Color secondary = const Color(0xFFFEB1AC);

  static final Color gradientLight = const Color(0xFFF5EDED);
  static final Color gradientDark = const Color(0xFFFEB0AB);

  static ThemeData getTheme() {
    return ThemeData(
        scaffoldBackgroundColor: const Color(0xffebb5b5),
        primaryColor: primary,
        visualDensity: VisualDensity.adaptivePlatformDensity);
  }
}
