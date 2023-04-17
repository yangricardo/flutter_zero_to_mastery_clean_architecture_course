import 'package:flutter/material.dart';
import 'dart:math';

class AppTheme {
  AppTheme._();

  // *****************
  // static colors
  // *****************
  static final Color _lightPrimaryColor = Colors.blueGrey.shade50;
  static final Color _lightPrimaryVariantColor = Colors.blueGrey.shade800;
  static final Color _lightOnPrimaryColor = Colors.blueGrey.shade200;
  static const Color _lightTextColorPrimary = Colors.black;
  static const Color _appbarColorLight = Colors.blue;

  static final Color _darkPrimaryColor = Colors.blueGrey.shade900;
  static const Color _darkPrimaryVariantColor = Colors.black;
  static final Color _darkOnPrimaryColor = Colors.blueGrey.shade300;
  static const Color _darkTextColorPrimary = Colors.white;
  static final Color _appbarColorDark = Colors.blueGrey.shade800;

  static const Color _iconColor = Colors.white;

  static const Color _accentColor = Color.fromRGBO(74, 217, 217, 1);

  static Color getRandomColor() {
    return Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
  }

  static Color getCompliantTextColor(Color backgroundColor) {
    final luminance = (0.299 * backgroundColor.red +
            0.587 * backgroundColor.green +
            0.114 * backgroundColor.blue) /
        255;
    return luminance > 0.5 ? Colors.black : Colors.white;
  }

  // *****************
  // Text Style - light
  // *****************
  static const TextStyle _lightHeadingText = TextStyle(
    color: _lightTextColorPrimary,
    fontFamily: "Rubik",
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle _lightBodyText = TextStyle(
    color: _lightTextColorPrimary,
    fontFamily: "Rubik",
    fontStyle: FontStyle.italic,
    fontWeight: FontWeight.bold,
    fontSize: 16,
  );

  static const TextTheme _lightTextTheme = TextTheme(
    displayLarge: _lightHeadingText,
    bodyLarge: _lightBodyText,
  );

  // *****************
  // Text Style - dark
  // *****************
  static final TextStyle _darkThemeHeadingTextStyle =
      _lightHeadingText.copyWith(color: _darkTextColorPrimary);

  static final TextStyle _darkThemeBodyTextStyle =
      _lightBodyText.copyWith(color: _darkTextColorPrimary);

  static final TextTheme _darkTextTheme = TextTheme(
    displayLarge: _darkThemeHeadingTextStyle,
    bodyLarge: _darkThemeBodyTextStyle,
  );

  // *****************
  // Theme light/dark
  // *****************

  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: _lightPrimaryColor,
    appBarTheme: const AppBarTheme(
      color: _appbarColorLight,
      iconTheme: IconThemeData(color: _iconColor),
    ),
    colorScheme: ColorScheme.light(
      primary: _lightPrimaryColor,
      onPrimary: _lightOnPrimaryColor,
      secondary: _accentColor,
      primaryContainer: _lightPrimaryVariantColor,
    ),
    textTheme: _lightTextTheme,
    bottomAppBarTheme: const BottomAppBarTheme(color: _appbarColorLight),
  );

  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: _darkPrimaryColor,
    appBarTheme: AppBarTheme(
      color: _appbarColorDark,
      iconTheme: const IconThemeData(color: _iconColor),
    ),
    colorScheme: ColorScheme.dark(
      primary: _darkPrimaryColor,
      secondary: _accentColor,
      onPrimary: _darkOnPrimaryColor,
      primaryContainer: _darkPrimaryVariantColor,
    ),
    textTheme: _darkTextTheme,
    bottomAppBarTheme: BottomAppBarTheme(color: _appbarColorDark),
  );

  static ThemeData generateThemeData(Color backgroundColor) {
    final isLight = backgroundColor.computeLuminance() > 0.5;
    final Color textColor =
        isLight ? _darkTextColorPrimary : _lightTextColorPrimary;
    final Color primaryVariant =
        isLight ? _darkPrimaryVariantColor : _lightPrimaryVariantColor;
    final Color onPrimary =
        isLight ? _darkOnPrimaryColor : _lightOnPrimaryColor;
    final Brightness brightness =
        ThemeData.estimateBrightnessForColor(backgroundColor);

    return ThemeData(
      scaffoldBackgroundColor: backgroundColor,
      appBarTheme: const AppBarTheme(
        color: _appbarColorLight,
        iconTheme: IconThemeData(color: _iconColor),
      ),
      colorScheme: ColorScheme(
          primary: backgroundColor,
          primaryContainer: primaryVariant,
          onPrimary: onPrimary,
          secondary: _accentColor,
          secondaryContainer: _accentColor,
          onSecondary: isLight ? _darkTextColorPrimary : _lightTextColorPrimary,
          background: backgroundColor,
          onBackground: textColor,
          error: Colors.red,
          onError: Colors.white,
          surface: Colors.white,
          onSurface: _lightTextColorPrimary,
          brightness: brightness),
      textTheme: isLight
          ? _darkTextTheme.copyWith(
              displayLarge:
                  _darkThemeHeadingTextStyle.copyWith(color: textColor),
              bodyLarge: _darkThemeBodyTextStyle.copyWith(color: textColor),
            )
          : _lightTextTheme.copyWith(
              displayLarge: _lightHeadingText.copyWith(color: textColor),
              bodyLarge: _lightBodyText.copyWith(color: textColor),
            ),
      bottomAppBarTheme: const BottomAppBarTheme(color: _appbarColorLight),
    );
  }
}
