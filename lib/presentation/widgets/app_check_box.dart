import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quran_test/core/constants/app_media.dart';
import 'package:quran_test/core/constants/app_sizes.dart';
import 'package:quran_test/core/extensions/num_extenison.dart';
import 'package:quran_test/core/responsive/responsive_helper.dart';
import 'package:quran_test/core/theming/app_colors.dart';
import 'package:quran_test/core/theming/app_styles.dart';
import 'package:quran_test/core/utilities/app_functions.dart';

class AppCheckBox extends StatelessWidget {
  const AppCheckBox({
    required this.title,
    required this.isChecked,
    this.onChanged,
    this.flex = 0,
    this.size,
    this.mainAxisAlignment = MainAxisAlignment.spaceBetween,
    super.key,
  });

  final void Function(bool isChecked)? onChanged;
  final String title;
  final bool isChecked;
  final int flex;
  final double? size;
  final MainAxisAlignment mainAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:
          onChanged == null
              ? null
              : () {
                AppFunctions.unFocusKeyboard();
                onChanged!(!isChecked);
              },
      splashColor: Colors.black.withValues(alpha: 0.02),
      highlightColor: Colors.black.withValues(alpha: 0.02),
      child: Padding(
        padding: AppSizes.checkBoxPadding,
        child: Row(
          mainAxisAlignment: mainAxisAlignment,
          children: [
            Expanded(
              flex: flex,
              child: Text(
                title,
                style: AppStyles.checkBoxTitleStyle(
                  AppStyles.checkBoxColor(isChecked),
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            7.hSpace,
            Container(
              width: size ?? AppSizes.checkBoxSize.r,
              height: size ?? AppSizes.checkBoxSize.r,
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppStyles.checkBoxColor(isChecked),
                  width: AppSizes.border.r,
                ),
                borderRadius: BorderRadius.circular(3.r),
              ),
              child:
                  isChecked
                      ? Center(
                        child: SvgPicture.asset(
                          AppSvgs.check,
                          height: getValueForScreenType(medium: 9, large: 22).r,
                          colorFilter: AppColors.colorFliter(
                            AppStyles.checkBoxColor(isChecked),
                          ),
                        ),
                      )
                      : null,
            ),
          ],
        ),
      ),
    );
  }
}
