part of 'di_imports.dart';

Future<void> _initUseCases() async {
  sl
    ..registerLazySingleton(() => GetSurahListUseCase(sl()))
    ..registerLazySingleton(() => GetJuzListUseCase(sl()));
}
