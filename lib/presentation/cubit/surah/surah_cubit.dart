import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quran_test/data/models/app_model.dart';
import 'package:quran_test/data/usecases/get_surah_list_use_case.dart';

part 'surah_state.dart';
part 'surah_cubit.freezed.dart';

class SurahCubit extends Cubit<SurahState> {
  SurahCubit(this._getSurahListUseCase) : super(const SurahState());

  final GetSurahListUseCase _getSurahListUseCase;

  Future<void> getSurahList(List<AppModel> selectedSurahList) async {
    emit(
      state.copyWith(
        surahList: _getSurahListUseCase(),
        selectedSurahList: selectedSurahList,
      ),
    );
  }

  void selectSurah(AppModel surah) {
    final selectedSurahList = [...state.selectedSurahList];
    if (selectedSurahList.contains(surah)) {
      selectedSurahList.remove(surah);
    } else {
      selectedSurahList.add(surah);
    }
    emit(
      state.copyWith(
        selectedSurahList:
            selectedSurahList..sort((a, b) => a.number.compareTo(b.number)),
      ),
    );
  }

  void selectAll() {
    emit(
      state.copyWith(
        selectedSurahList: isAllSelected() ? [] : [...state.surahList],
      ),
    );
  }

  bool isSurahSelected(AppModel surah) {
    return state.selectedSurahList.contains(surah);
  }

  bool isAllSelected() {
    return state.selectedSurahList.length == 114;
  }
}
