import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran_test/core/constants/app_sizes.dart';
import 'package:quran_test/core/theming/app_colors.dart';

class AppContainer extends StatelessWidget {
  const AppContainer({
    this.child,
    super.key,
    this.padding,
    this.height,
    this.width,
    this.alignment,
    this.shape = BoxShape.rectangle,
    this.border,
    this.borderColor,
    this.backgroundColor,
    this.constraints,
    this.borderRadius,
    this.onTap,
  });

  final Widget? child;
  final EdgeInsetsGeometry? padding;
  final double? height;
  final double? width;
  final AlignmentGeometry? alignment;
  final BoxShape shape;
  final BoxBorder? border;
  final Color? borderColor;
  final Color? backgroundColor;
  final BoxConstraints? constraints;
  final VoidCallback? onTap;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius:
          borderRadius ??
          (shape == BoxShape.circle ? null : AppSizes.borderRadius),
      child: Container(
        height: height,
        width: width,
        padding: padding ?? AppSizes.containerPadding,
        alignment: alignment,
        constraints: constraints,
        decoration: BoxDecoration(
          shape: shape,
          color: backgroundColor ?? Colors.white,
          border:
              border ??
              Border.all(
                color: borderColor ?? AppColors.cC1C1C1,
                width: AppSizes.border.r,
              ),
          borderRadius:
              borderRadius ??
              (shape == BoxShape.circle ? null : AppSizes.borderRadius),
        ),
        child: child,
      ),
    );
  }
}
