import 'package:equatable/equatable.dart';
import 'package:quran_test/data/models/app_model.dart';

class TestModel extends Equatable {
  const TestModel(
    this.fromPage,
    this.toPage, {
    required this.surahList,
    required this.juzList,
  });

  final List<AppModel> surahList;
  final List<AppModel> juzList;
  final int fromPage;
  final int toPage;

  @override
  List<Object?> get props => [surahList, juzList, fromPage, toPage];
}
