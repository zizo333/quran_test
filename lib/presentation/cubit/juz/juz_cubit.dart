import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quran_test/data/models/app_model.dart';
import 'package:quran_test/data/usecases/get_juz_list_use_case.dart';

part 'juz_state.dart';
part 'juz_cubit.freezed.dart';

class JuzCubit extends Cubit<JuzState> {
  JuzCubit(this._getJuzListUseCase) : super(const JuzState());

  final GetJuzListUseCase _getJuzListUseCase;

  Future<void> getJuzList(List<AppModel> selectedJuzList) async {
    final juzList = await _getJuzListUseCase();
    emit(state.copyWith(juzList: juzList, selectedJuzList: selectedJuzList));
  }

  void selectJuz(AppModel juz) {
    final selectedJuzList = [...state.selectedJuzList];
    if (selectedJuzList.contains(juz)) {
      selectedJuzList.remove(juz);
    } else {
      selectedJuzList.add(juz);
    }
    emit(
      state.copyWith(
        selectedJuzList:
            selectedJuzList..sort((a, b) => a.number.compareTo(b.number)),
      ),
    );
  }

  void selectAll() {
    emit(
      state.copyWith(
        selectedJuzList: isAllSelected() ? [] : [...state.juzList],
      ),
    );
  }

  bool isJuzSelected(AppModel juz) {
    return state.selectedJuzList.contains(juz);
  }

  bool isAllSelected() {
    return state.selectedJuzList.length == 30;
  }
}
