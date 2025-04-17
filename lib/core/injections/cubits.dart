part of 'di_imports.dart';

Future<void> _initCubits() async {
  sl
    ..registerFactory(HomeCubit.new)
    ..registerFactory(() => SurahCubit(sl()))
    ..registerFactory(() => JuzCubit(sl()));
}
