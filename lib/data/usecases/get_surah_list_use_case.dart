import 'package:quran_test/core/usecases/usecases.dart';
import 'package:quran_test/data/models/app_model.dart';
import 'package:quran_test/data/repos/quran_repo.dart';

class GetSurahListUseCase implements UseCaseWithoutParams<List<AppModel>> {
  GetSurahListUseCase(this._quranRepo);

  final QuranRepo _quranRepo;

  @override
  List<AppModel> call() => _quranRepo.getSurahList();
}
