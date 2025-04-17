part of 'surah_cubit.dart';

@freezed
abstract class SurahState with _$SurahState {
  const factory SurahState({
    @Default([]) List<AppModel> surahList,
    @Default([]) List<AppModel> selectedSurahList,
  }) = _SurahState;
}
