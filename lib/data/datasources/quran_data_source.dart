import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:quran/quran.dart' as quran;
import 'package:quran_test/core/constants/app_path.dart';
import 'package:quran_test/core/utilities/typedefs.dart';
import 'package:quran_test/data/models/app_model.dart';

class QuranDataSource {
  List<AppModel> getSurahList() {
    return List.generate(114, (number) {
      final surah = quran.getSurahNameArabic(number + 1);
      return AppModel(number: number, name: surah);
    });
  }

  Future<List<AppModel>> getJuzList() async {
    final juzListStr = await rootBundle.loadString(AppPath.juzPath);
    final juzList = jsonDecode(juzListStr) as List;
    return juzList.map((juz) => AppModel.fromMap(juz as DataMap)).toList();
  }
}
