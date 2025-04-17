import 'package:quran_test/data/datasources/quran_data_source.dart';
import 'package:quran_test/data/models/app_model.dart';

class QuranRepo {
  QuranRepo(this._quranDataSource);

  final QuranDataSource _quranDataSource;

  List<AppModel> getSurahList() {
    return _quranDataSource.getSurahList();
  }

  Future<List<AppModel>> getJuzList() async {
    return _quranDataSource.getJuzList();
  }
}
