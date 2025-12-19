import 'dart:ui';

import 'package:csv/csv.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/services.dart' show rootBundle;

/// Loads all translations from a single CSV file.
/// The CSV must have a header row like: key,en,ko
/// and subsequent rows with: some.key,Some EN value,어떤 KO 값
class CsvSingleFileAssetLoader extends AssetLoader {
  const CsvSingleFileAssetLoader({this.fileName = 'languages.csv'});

  final String fileName;

  @override
  Future<Map<String, dynamic>> load(String fullPath, Locale locale) async {
    final String csvText = await rootBundle.loadString('$fullPath/$fileName');
    final List<List<dynamic>> rows =
        const CsvToListConverter(eol: '\n', shouldParseNumbers: false).convert(csvText);

    if (rows.isEmpty) {
      return <String, dynamic>{};
    }

    final List<dynamic> header = rows.first;
    final int keyIndex = 0;
    final String languageCode = locale.languageCode;
    final int localeIndex = header.indexOf(languageCode);

    if (localeIndex <= 0) {
      // Locale column not found; return empty to avoid crashes.
      return <String, dynamic>{};
    }

    final Map<String, dynamic> translations = <String, dynamic>{};
    for (int i = 1; i < rows.length; i++) {
      final List<dynamic> row = rows[i];
      if (row.length <= localeIndex || row.length <= keyIndex) {
        continue;
      }
      final String key = row[keyIndex].toString();
      final String value = row[localeIndex].toString();
      if (key.isEmpty) continue;
      translations[key] = value;
    }
    return translations;
  }
}


