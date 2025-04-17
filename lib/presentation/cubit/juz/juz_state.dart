part of 'juz_cubit.dart';

@freezed
abstract class JuzState with _$JuzState {
  const factory JuzState({
    @Default([]) List<AppModel> juzList,
    @Default([]) List<AppModel> selectedJuzList,
  }) = _JuzState;
}
