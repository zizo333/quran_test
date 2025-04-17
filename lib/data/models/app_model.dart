import 'package:equatable/equatable.dart';
import 'package:quran_test/core/utilities/typedefs.dart';

class AppModel extends Equatable {
  const AppModel({required this.number, required this.name});

  factory AppModel.fromMap(DataMap map) {
    return AppModel(number: map['number'] as int, name: map['name'] as String);
  }

  final int number;
  final String name;

  @override
  List<Object?> get props => [number, name];
}
