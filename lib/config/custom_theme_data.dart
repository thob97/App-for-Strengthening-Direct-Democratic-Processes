import 'package:flutter/material.dart';

// ignore:avoid_classes_with_only_static_members
class CustomThemeData {
  ///ColorSchemes
  static final _lightFillColor = Colors.black;
  static const _darkFillColor = Colors.white;
  static final Color _lightFocusColor = Colors.black.withOpacity(0.12);
  static final Color _darkFocusColor = Colors.white.withOpacity(0.12);

  static final ColorScheme _lightColorScheme = ColorScheme(
    primary: const Color(0xFF194C76),
    //Primary
    secondary: _lightFillColor,
    background: const Color(0xFFCBE0F4), //Background
    surface: Colors.white,
    onBackground: const Color(0xFF4389C8), //Background accent
    error: _lightFillColor,
    onError: _lightFillColor,
    onPrimary: Colors.white,
    onSecondary: _lightFillColor,
    onSurface: _lightFillColor,
    primaryVariant: _lightFillColor,
    secondaryVariant: _lightFillColor,
    brightness: Brightness.light,
  );

  static const ColorScheme _darkColorScheme = ColorScheme(
    primary: _darkFillColor,
    secondary: _darkFillColor,
    background: _darkFillColor,
    surface: _darkFillColor,
    onBackground: _darkFillColor, // White with 0.05 opacity
    error: _darkFillColor,
    onError: _darkFillColor,
    onPrimary: _darkFillColor,
    onSecondary: _darkFillColor,
    onSurface: _darkFillColor,
    primaryVariant: _darkFillColor,
    secondaryVariant: _darkFillColor,
    brightness: Brightness.dark,
  );

  ///TextTheme
  static const _regular = FontWeight.w400;
  // ignore:unused_field
  static const _medium = FontWeight.w500;
  // ignore:unused_field
  static const _semiBold = FontWeight.w600;
  static const _bold = FontWeight.w700;
  static const _textOverflow = TextOverflow.ellipsis;

  static const TextTheme _textTheme = TextTheme(
    ///body text
    bodyText1: TextStyle(
      fontFamily: 'Poppins',
      fontWeight: _regular,
      fontSize: 20,
      overflow: _textOverflow,
    ),

    ///large headline
    headline5: TextStyle(
      fontFamily: 'Poppins',
      fontWeight: _bold,
      fontSize: 42,
      overflow: _textOverflow,
    ),

    ///card body
    bodyText2: TextStyle(
      fontFamily: 'Poppins',
      fontWeight: _semiBold,
      fontSize: 14,
      overflow: _textOverflow,
    ),

    ///card headline
    headline2: TextStyle(
      fontFamily: 'Poppins',
      fontWeight: _bold,
      fontSize: 20,
      overflow: _textOverflow,
    ),
  );

  ///ThemeData
  static final ThemeData lightThemeData =
      themeData(_lightColorScheme, _lightFocusColor);
  static final ThemeData darkThemeData =
      themeData(_darkColorScheme, _darkFocusColor);

  static ThemeData themeData(ColorScheme colorScheme, Color focusColor) {
    return ThemeData(
      colorScheme: colorScheme,
      textTheme: _textTheme,

      ///AppBarTheme
      appBarTheme: AppBarTheme(
        backgroundColor: colorScheme.primary,
        elevation: 4,
        iconTheme: IconThemeData(color: colorScheme.background),
      ),

      ///BottomNavigationBarTheme
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: colorScheme.primary,
        elevation: 0,
        selectedIconTheme: IconThemeData(color: colorScheme.background),
        unselectedIconTheme: IconThemeData(color: colorScheme.onBackground),
      ),

      ///DividerTheme
      dividerTheme: const DividerThemeData(
        space: 0,
        thickness: 1.5,
      ),

      ///CardTheme
      cardTheme: CardTheme(
        color: colorScheme.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(MyConstants.borderRadius),
        ),
      ),

      ///etc
      checkboxTheme: const CheckboxThemeData(shape: CircleBorder()),
      primaryIconTheme: IconThemeData(color: colorScheme.onBackground),
      iconTheme: IconThemeData(color: colorScheme.onBackground),
      canvasColor: colorScheme.background,
      scaffoldBackgroundColor: colorScheme.background,
      highlightColor: Colors.transparent,
      focusColor: focusColor,

      ///This may be used for notifications
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        backgroundColor: Color.alphaBlend(
          _lightFillColor.withOpacity(0.80),
          _darkFillColor,
        ),
        contentTextStyle: _textTheme.subtitle1?.apply(color: _darkFillColor),
      ),
    );
  }
}

class MyConstants {
  static const double borderRadius = 8;
  static const double horPagePadding = 16;
  static const double verPagePadding = 30;
  static const EdgeInsets pagePadding = EdgeInsets.symmetric(
    vertical: 30,
    horizontal: 16,
  );
}
