import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quran_test/data/models/app_model.dart';
import 'package:quran_test/presentation/cubit/base/base_cubit.dart';
import 'package:quran_test/presentation/cubit/base/base_data.dart';

part 'home_data.dart';
part 'home_state.dart';
part 'home_cubit.freezed.dart';

class HomeCubit extends BaseCubit<HomeState, HomeData> {
  HomeCubit() : super(const HomeState(), HomeData._());

  void setSurahList(List<AppModel> surahList) {
    emit(state.copyWith(surahList: surahList));
  }

  void setJuzList(List<AppModel> juzList) {
    emit(state.copyWith(juzList: juzList));
  }

  void selectFromPageNumber() {
    data.fromPageController.selection = TextSelection(
      baseOffset: 0,
      extentOffset: data.fromPageController.text.length,
    );
  }

  void selectToPageNumber() {
    data.toPageController.selection = TextSelection(
      baseOffset: 0,
      extentOffset: data.toPageController.text.length,
    );
  }
}
