import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';

extension EasyLocalizationX on String {

  String tr2({
    List<String>? args,
    Map<String, String>? namedArgs,
    String? gender,
    BuildContext? context,
  }) => tr(
    this,
    args: args,
    namedArgs: namedArgs,
    gender: gender,
    context: context,
  ).replaceAll('\\n', '\n');

}