import 'package:equatable/equatable.dart';
import 'package:quran_test/data/models/app_model.dart';

class TestModel extends Equatable {
  const TestModel({required this.surahList, required this.juzList});

  final List<AppModel> surahList;
  final List<AppModel> juzList;

  @override
  List<Object?> get props => [surahList, juzList];
}
