import 'package:flutter/material.dart';
import 'package:project_crew/core/config/colors.dart';
import 'package:project_crew/core/extension/context_extension.dart';

extension MaterialColorX on Color {
  MaterialColor toMaterialColor() {
    return this is MaterialColor
        ? (this as MaterialColor)
        : AppColors.createMaterialColor(this);
  }
}

var kDarkAppTheme = ThemeData(
  fontFamily: 'Pretendard',
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    seedColor: Color(0xff2580ff),
    brightness: Brightness.dark,
  ).copyWith(
    primary: Color(0xff2580ff),
    // onPrimary: Colors.white,
    secondary: Color(0xff88baff),
    // onSecondary: Colors.black,
    tertiary: Color(0xffe0edff),
    // onTertiary: Colors.black,
    // surface: Colors.white,
    // onSurface: Colors.black,
    // outline: Colors.black,
  ),
  scaffoldBackgroundColor: Color(0xfff6f6f6),
  // dialogBackgroundColor: Colors.white,
  // dialogTheme: DialogTheme(
  //   backgroundColor: Colors.white,
  // ),

  /// Material Effect Disabled
  // highlightColor: Colors.transparent,
  splashColor: Colors.transparent,
  splashFactory: NoSplash.splashFactory,
);

var kLightAppTheme = ThemeData(
  fontFamily: 'Pretendard',
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    seedColor: Color(0xff2580ff),
    brightness: Brightness.light,
  ).copyWith(
    primary: Color(0xff2580ff),
    // onPrimary: Colors.white,
    secondary: Color(0xff88baff),
    // onSecondary: Colors.black,
    tertiary: Color(0xffe0edff),
    // onTertiary: Colors.black,
    // surface: Colors.white,
    // onSurface: Colors.black,
    // outline: Colors.black,
  ),
  scaffoldBackgroundColor: Color(0xfff6f6f6),
  // dialogBackgroundColor: Colors.white,
  // dialogTheme: DialogTheme(
  //   backgroundColor: Colors.white,
  // ),

  /// Material Effect Disabled
  // highlightColor: Colors.transparent,
  splashColor: Colors.transparent,
  splashFactory: NoSplash.splashFactory,
);

extension ColorStyleX on BuildContext {
  FigmaColorStyle get appColor => FigmaColorStyle(context: this);
}

class FigmaColorStyle {
  const FigmaColorStyle({
    required this.context,
  });

  final BuildContext context;

  Color get mainBlack => context.isDarkMode == true
      ? Color(0xff090909) : Color(0xff090909);

  Color get darkGray => context.isDarkMode == true
      ? Color(0xff444444) : Color(0xff444444);

  Color get gray => context.isDarkMode == true
      ? Color(0xff767676) : Color(0xff767676);

  Color get lightGray => context.isDarkMode == true
      ? Color(0xff767676) : Color(0xff767676);

  Color get disableGray => context.isDarkMode == true
      ? Color(0xffa9a9a9) : Color(0xffa9a9a9);

  Color get borderGray => context.isDarkMode == true
      ? Color(0xffd5d5d5) : Color(0xffd5d5d5);

  Color get borderLightGray => context.isDarkMode == true
      ? Color(0xffececec) : Color(0xffececec);

  Color get bgGray => context.isDarkMode == true
      ? Color(0xfff6f6f6) : Color(0xfff6f6f6);

  Color get thickDark => context.isDarkMode == true
      ? Color(0xff121212).withValues(alpha: 0.85)
      : Color(0xff121212).withValues(alpha: 0.85);

  Color get regularDark => context.isDarkMode == true
      ? Color(0xff212328).withValues(alpha: 0.75)
      : Color(0xff212328).withValues(alpha: 0.75);

  Color get thinDark => context.isDarkMode == true
      ? Color(0xff2d3034).withValues(alpha: 0.65)
      : Color(0xff2d3034).withValues(alpha: 0.65);

  Color get ultraThinDark => context.isDarkMode == true
      ? Color(0xff333538).withValues(alpha: 0.5)
      : Color(0xff333538).withValues(alpha: 0.5);

  Color get thickLight => context.isDarkMode == true
      ? Color(0xfffefefe).withValues(alpha: 0.8)
      : Color(0xfffefefe).withValues(alpha: 0.8);

  Color get regularLight => context.isDarkMode == true
      ? Color(0xfffefefe).withValues(alpha: 0.7)
      : Color(0xfffefefe).withValues(alpha: 0.7);

  Color get thinLight => context.isDarkMode == true
      ? Color(0xfffefefe).withValues(alpha: 0.6)
      : Color(0xfffefefe).withValues(alpha: 0.6);

  Color get ultraThinLight => context.isDarkMode == true
      ? Color(0xfffefefe).withValues(alpha: 0.4)
      : Color(0xfffefefe).withValues(alpha: 0.4);

  Color get white => context.isDarkMode == true
      ? Colors.white : Colors.white;

  Color get dim => context.isDarkMode == true
      ? Color(0xff000000).withValues(alpha: 0.7)
      : Color(0xff000000).withValues(alpha: 0.7);

  Color get red => context.isDarkMode == true
      ? Colors.red : Colors.red;
}