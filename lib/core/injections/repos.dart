part of 'di_imports.dart';

Future<void> _initRepos() async {
  sl.registerLazySingleton(() => QuranRepo(sl()));
}
