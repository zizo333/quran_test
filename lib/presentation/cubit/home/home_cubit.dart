import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quran_test/data/models/app_model.dart';

part 'home_state.dart';
part 'home_cubit.freezed.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState());

  void setSurahList(List<AppModel> surahList) {
    emit(state.copyWith(surahList: surahList));
  }

  void setJuzList(List<AppModel> juzList) {
    emit(state.copyWith(juzList: juzList));
  }
}
