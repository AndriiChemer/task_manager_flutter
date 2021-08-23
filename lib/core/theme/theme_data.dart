import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'theme.dart';

class ThemeConfig {
  static ThemeData createTheme({
    required Brightness brightness,
    required Color buttonColor,
    required Color iconColor,
    required Color background,
    required Color primaryText,
    required Color secondaryText,
    required Color accentColor,
    required Color divider,
    required Color buttonBackground,
    required Color buttonText,
    required Color cardBackground,
    required Color disabled,
    required Color error,
  }) {
    final baseTextTheme = brightness == Brightness.dark
        ? Typography.blackMountainView
        : Typography.whiteMountainView;

    return ThemeData(
      brightness: brightness,
      buttonColor: buttonBackground,
      canvasColor: background,
      cardColor: background,
      dividerColor: divider,
      dividerTheme: DividerThemeData(
        color: divider,
        space: 1,
        thickness: 1,
      ),
      cardTheme: CardTheme(
        color: cardBackground,
        margin: EdgeInsets.zero,
        clipBehavior: Clip.antiAliasWithSaveLayer,
      ),
      backgroundColor: background,
      primaryColor: accentColor,
      accentColor: accentColor,

      // textSelectionHandleColor: accentColor,
      // cursorColor: accentColor,
      textSelectionTheme: TextSelectionThemeData(
        selectionColor: Colors.yellow,
        selectionHandleColor: accentColor,
        cursorColor: accentColor,
      ),
      toggleableActiveColor: accentColor,
      appBarTheme: AppBarTheme(
        titleTextStyle: TextStyle(color: Colors.black),
        toolbarTextStyle: TextStyle(color: Colors.black),
        brightness: brightness,
        color: cardBackground,
        textTheme: TextTheme(
          bodyText1: baseTextTheme.bodyText1?.copyWith(
            color: Colors.black,
            fontSize: 18,
          ),
        ),
        iconTheme: IconThemeData(
          color: iconColor,
        ),
      ),
      iconTheme: IconThemeData(
        color: iconColor,
        size: 16.0,
      ),

      errorColor: error,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          primary: buttonColor,// background
          onPrimary: iconColor,
        )
      ),
      buttonTheme: ButtonThemeData(
        textTheme: ButtonTextTheme.primary,
        buttonColor: buttonColor,
        colorScheme: ColorScheme(
          brightness: brightness,
          primary: accentColor,
          primaryVariant: accentColor,
          secondary: accentColor,
          secondaryVariant: accentColor,
          surface: background,
          background: background,
          error: error,
          onPrimary: buttonText,
          onSecondary: buttonText,
          onSurface: buttonText,
          onBackground: buttonText,
          onError: buttonText,
        ),
        padding: const EdgeInsets.all(16.0),
      ),
      cupertinoOverrideTheme: CupertinoThemeData(
        brightness: brightness,
        primaryColor: accentColor,
      ),
      inputDecorationTheme: InputDecorationTheme(
        errorStyle: TextStyle(color: error),
        labelStyle: TextStyle(
          fontFamily: 'Rubik',
          fontWeight: FontWeight.w600,
          fontSize: 16.0,
          color: primaryText.withOpacity(0.5),
        ),
        hintStyle: TextStyle(
          color: iconColor,
          fontSize: 13.0,
          fontWeight: FontWeight.w300,
        ),
      ),
      fontFamily: 'Rubik',
      unselectedWidgetColor: hexToColor('#DADCDD'),
      textTheme: TextTheme(
        headline1: baseTextTheme.headline1?.copyWith(
          color: iconColor,
          fontSize: 34.0,
          fontWeight: FontWeight.bold,
        ),
        headline2: baseTextTheme.headline2?.copyWith(
          color: iconColor,
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
        headline3: baseTextTheme.headline3?.copyWith(
          color: iconColor,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
        headline4: baseTextTheme.headline4?.copyWith(
          color: iconColor,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
        headline5: baseTextTheme.headline5?.copyWith(
          color: iconColor,
          fontSize: 16,
          fontWeight: FontWeight.w700,
        ),
        headline6: baseTextTheme.headline6?.copyWith(
          color: iconColor,
          fontSize: 14,
          fontWeight: FontWeight.w700,
        ),
        bodyText1: baseTextTheme.bodyText1?.copyWith(
          color: iconColor,
          fontSize: 15,
        ),
        bodyText2: baseTextTheme.bodyText2?.copyWith(
          color: iconColor,
          fontSize: 12,
          fontWeight: FontWeight.w400,
        ),
        button: baseTextTheme.button?.copyWith(
          color: primaryText,
          fontSize: 12.0,
          fontWeight: FontWeight.w700,
        ),
        caption: baseTextTheme.caption?.copyWith(
          color: iconColor,
          fontSize: 11.0,
          fontWeight: FontWeight.w300,
        ),
        overline: baseTextTheme.overline?.copyWith(
          color: iconColor,
          fontSize: 11.0,
          fontWeight: FontWeight.w500,
        ),
        subtitle1: baseTextTheme.subtitle1?.copyWith(
          color: iconColor,
          fontSize: 16.0,
          fontWeight: FontWeight.w700,
        ),
        subtitle2: baseTextTheme.subtitle2?.copyWith(
          color: iconColor,
          fontSize: 11.0,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  static ThemeData get theme {
    return lightTheme;
  }

  static ThemeData get lightTheme => createTheme(
    iconColor: ColorConstants.darkGray,
    buttonColor: ColorConstants.buttonColorLight,
    brightness: Brightness.light,
    background: ColorConstants.lightScaffoldBackgroundColor,
    cardBackground: ColorConstants.secondaryAppColor,
    primaryText: Colors.black,
    secondaryText: Colors.white,
    accentColor: ColorConstants.darkGray,
    divider: ColorConstants.secondaryAppColor,
    buttonBackground: Colors.black38,
    buttonText: ColorConstants.secondaryAppColor,
    disabled: ColorConstants.secondaryAppColor,
    error: Colors.red,
  );
}