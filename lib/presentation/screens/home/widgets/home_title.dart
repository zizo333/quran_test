import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran_test/core/extensions/context_extension.dart';
import 'package:quran_test/core/theming/app_styles.dart';
import 'package:quran_test/core/theming/font_weight_helper.dart';

class HomeTitle extends StatelessWidget {
  const HomeTitle({required this.title, super.key});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      '✿ $title',
      style: AppTextStyle(
        fontSize: 14.sp,
        color: context.colorScheme.primary,
        fontWeight: FontWeightHelper.bold,
      ),
    );
  }
}
