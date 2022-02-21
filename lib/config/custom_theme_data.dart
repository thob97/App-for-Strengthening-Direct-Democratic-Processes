import 'package:flutter/material.dart';

// ignore:avoid_classes_with_only_static_members
class CustomThemeData {
  ///ColorSchemes
  static const _lightFillColor = Colors.black;
  static const _darkFillColor = Colors.white;
  static final Color _lightFocusColor = Colors.black.withOpacity(0.12);
  static final Color _darkFocusColor = Colors.white.withOpacity(0.12);

  static const ColorScheme _lightColorScheme = ColorScheme(
    primary: Color(0xFF194C76),
    //Primary
    secondary: _lightFillColor,
    background: Color(0xFFCBE0F4),
    //Background
    surface: Colors.white,
    onBackground: Color(0xFF4389C8),
    //Background accent
    error: _lightFillColor,
    onError: _lightFillColor,
    onPrimary: Colors.white,
    onSecondary: _lightFillColor,
    onSurface: _lightFillColor,
    primaryContainer: _lightFillColor,
    secondaryContainer: _lightFillColor,
    brightness: Brightness.light,
  );

  static const ColorScheme _darkColorScheme = ColorScheme(
    primary: _darkFillColor,
    secondary: _darkFillColor,
    background: _darkFillColor,
    surface: _darkFillColor,
    onBackground: _darkFillColor,
    // White with 0.05 opacity
    error: _darkFillColor,
    onError: _darkFillColor,
    onPrimary: _darkFillColor,
    onSecondary: _darkFillColor,
    onSurface: _darkFillColor,
    primaryContainer: _darkFillColor,
    secondaryContainer: _darkFillColor,
    brightness: Brightness.dark,
  );

  ///TextTheme
  static const TextTheme _textTheme = TextTheme(
    bodyText2: TextStyle(
      letterSpacing: 0.25,
    ),
    subtitle1: TextStyle(
      fontSize: 16,
    ),
    headline6: TextStyle(
      fontWeight: FontWeight.normal,
    ),
    button: TextStyle(
      color: Colors.white,
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

      ///ElevatedButtonTheme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          primary: colorScheme.primary,
          padding: const EdgeInsets.symmetric(horizontal: 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),

      ///etc
      checkboxTheme: const CheckboxThemeData(shape: CircleBorder()),
      primaryIconTheme: IconThemeData(color: colorScheme.onBackground),
      iconTheme: IconThemeData(color: colorScheme.onBackground, size: 24),
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
      ),
    );
  }
}

class MyConstants {
  static const double borderRadius = 8;
  static const double horPagePadding = 16;
  static const double botPagePadding = 15;
  static const EdgeInsets edgeHorPagePadding = EdgeInsets.symmetric(
    horizontal: 16,
  );
  static const EdgeInsets verPagePadding = EdgeInsets.symmetric(
    vertical: 30,
  );
  static const EdgeInsets pagePadding = EdgeInsets.symmetric(
    vertical: 30,
    horizontal: 16,
  );
}
