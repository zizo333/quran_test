import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran_test/core/constants/app_sizes.dart';
import 'package:quran_test/core/theming/app_colors.dart';
import 'package:quran_test/core/theming/app_styles.dart';
import 'package:quran_test/presentation/widgets/app_check_box.dart';
import 'package:quran_test/presentation/widgets/app_container.dart';

class BaseDialog extends StatelessWidget {
  const BaseDialog({required this.child, super.key, this.padding, this.header});

  final Widget child;
  final EdgeInsetsGeometry? padding;
  final Widget? header;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shadowColor: Colors.black,
      surfaceTintColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: AppSizes.borderRadius),
      titlePadding: EdgeInsets.zero,
      contentPadding: padding ?? AppSizes.screenPadding,
      content: Column(
        children: [if (header != null) header!, Expanded(child: child)],
      ),
    );
  }
}

class DialogCheckBoxHeader extends StatelessWidget {
  const DialogCheckBoxHeader({
    required this.isChecked,
    super.key,
    this.title,
    this.onTap,
  });

  final bool isChecked;
  final String? title;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return AppContainer(
      onTap: onTap,
      padding: EdgeInsets.zero,
      width: double.maxFinite,
      backgroundColor: AppColors.cEDEDED,
      borderColor: AppColors.cEDEDED,
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(AppSizes.radius.r),
      ),
      child: AppCheckBox(title: title ?? '', isChecked: isChecked),
    );
  }
}
