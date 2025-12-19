import 'package:flutter/material.dart';

class AppColors {

  // static MaterialColor get primary {
  //   var color = const Color(0xfff9e000);
  //   return MaterialColor(color.toARGB32(), {
  //     50: const Color(0xfffde9e2),
  //     100: const Color(0xffffa780),
  //     200: color,
  //     300: const Color(0xffcb4910),
  //     400: const Color(0xffac3804),
  //     500: const Color(0xffac3804),
  //     600: const Color(0xffac3804),
  //     700: const Color(0xffac3804),
  //     800: const Color(0xffac3804),
  //     900: const Color(0xffac3804),
  //   });
  // }
  //
  // static MaterialColor get secondary {
  //   var color = const Color(0xff467eff);
  //   return MaterialColor(color.toARGB32(), {
  //     50: const Color(0xffeaf0ff),
  //     100: const Color(0xff90b1ff),
  //     200: color,
  //     300: const Color(0xff1c55db),
  //     400: const Color(0xff0342d5),
  //     500: const Color(0xff0342d5),
  //     600: const Color(0xff0342d5),
  //     700: const Color(0xff0342d5),
  //     800: const Color(0xff0342d5),
  //     900: const Color(0xff0342d5),
  //   });
  // }
  //
  // static MaterialColor get gray {
  //   var color = const Color(0xff8b90a0);
  //   return MaterialColor(color.toARGB32(), {
  //     50: const Color(0xfff8f9fd),
  //     100: const Color(0xfff2f3f6),
  //     200: const Color(0xffe4e6ed),
  //     300: const Color(0xffc9cedb),
  //     400: const Color(0xffadb2bf),
  //     500: color,
  //     600: const Color(0xff696f80),
  //     700: const Color(0xff444855),
  //     800: const Color(0xff31343e),
  //     850: const Color(0xff22252d),
  //     900: const Color(0xff191b21),
  //   });
  // }

  static MaterialColor createMaterialColor(Color color) {
    List strengths = <double>[.05];
    Map<int, Color> swatch = {};
    final double r = color.r, g = color.g, b = color.b;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    for (var strength in strengths) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.from(
        alpha: 1.0,
        red: r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        green: g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        blue: b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      );
    }
    return MaterialColor(color.toARGB32(), swatch);
  }
}

extension MaterialColorX on MaterialColor {
  Color get shade850 => this[850] ?? this;
}

class AppGradients {
  const AppGradients._();

  static const LinearGradient loginBackground = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color.fromARGB(255, 255, 144, 144),
      Color.fromARGB(255, 246, 255, 175),
      Color.fromARGB(255, 139, 203, 225),
      Color.fromARGB(255, 198, 255, 203),
    ],
  );
}