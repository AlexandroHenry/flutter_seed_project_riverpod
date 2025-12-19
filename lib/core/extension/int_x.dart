import 'package:intl/intl.dart';

extension NumberFormats on int {
  String toStringReduction() {
    return NumberFormat.compact().format(this);
  }
}

// extension ThemeTypeX on int {
//   ThemeType toThemeType() {
//     return this == ThemeType.light.value
//         ? ThemeType.light : ThemeType.dark;
//   }
// }

extension HexIntX on int {
  String toHex() {
    return toRadixString(16).padLeft(2, '0').toLowerCase();
  }
}

extension StatusCodeX on int {
  bool validateStatus() => this >= 200 && this < 300 || this == 304;
}