import 'package:quran_test/core/constants/app_strings.dart';

mixin ValidatorMixin {
  String? validateEmptyText(String? text) {
    if (text?.trim().isEmpty ?? true) {
      return AppStrings.requiredField;
    }
    return null;
  }
}
