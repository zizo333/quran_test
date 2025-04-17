import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quran_test/core/errors/app_failure.dart';

part 'app_result.freezed.dart';

@freezed
abstract class AppResult<T> with _$AppResult<T> {
  const factory AppResult.right(T data) = _Success<T>;
  const factory AppResult.left(AppFailure failure) = _Failure;
}
