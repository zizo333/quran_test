part of 'di_imports.dart';

Future<void> _initDataSoureces() async {
  sl.registerLazySingleton(QuranDataSource.new);
}
