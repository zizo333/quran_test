import 'package:quran_test/core/usecases/usecases.dart';
import 'package:quran_test/data/models/app_model.dart';
import 'package:quran_test/data/repos/quran_repo.dart';

class GetJuzListUseCase implements FutureUseCaseWithoutParams<List<AppModel>> {
  GetJuzListUseCase(this._quranRepo);

  final QuranRepo _quranRepo;

  @override
  Future<List<AppModel>> call() => _quranRepo.getJuzList();
}
