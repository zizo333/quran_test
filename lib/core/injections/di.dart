part of 'di_imports.dart';

final sl = GetIt.I;

Future<void> initInjection() async {
  await _initCore();
  await _initDataSoureces();
  await _initRepos();
  await _initUseCases();
  await _initCubits();
}

Future<void> _initCore() async {
  final prefs = await SharedPreferences.getInstance();

  sl
    ..registerLazySingleton(() => prefs)
    ..registerLazySingleton(() => SharedPreferencesLogger(prefs))
    ..registerLazySingleton(SharedData.new);
}
