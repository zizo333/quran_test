part of 'home_cubit.dart';

@freezed
abstract class HomeState with _$HomeState {
  const factory HomeState({
    @Default([]) List<AppModel> surahList,
    @Default([]) List<AppModel> juzList,
  }) = _HomeState;
}
