import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran_test/core/constants/app_sizes.dart';
import 'package:quran_test/core/theming/app_colors.dart';
import 'package:quran_test/core/theming/app_styles.dart';
import 'package:quran_test/core/theming/font_weight_helper.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({
    super.key,
    this.title,
    this.leading,
    this.actions = const [],
  });

  final String? title;
  final Widget? leading;
  final List<Widget> actions;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(AppSizes.radius.r),
      ),
      child: AppBar(
        title: Text(title ?? ''),
        titleTextStyle: AppTextStyle(
          fontSize: 20.sp,
          color: AppColors.appBarTitle,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(AppSizes.appBarHeight.h);
}
