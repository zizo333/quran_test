import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran_test/core/constants/app_strings.dart';
import 'package:quran_test/core/extensions/context_extension.dart';
import 'package:quran_test/core/extensions/num_extenison.dart';
import 'package:quran_test/core/theming/app_styles.dart';
import 'package:quran_test/core/theming/font_weight_helper.dart';
import 'package:quran_test/data/models/app_model.dart';
import 'package:quran_test/presentation/screens/home/widgets/home_title.dart';
import 'package:quran_test/presentation/widgets/app_container.dart';

class HomeItemWidget extends StatelessWidget {
  const HomeItemWidget({
    required this.title,
    required this.items,
    required this.onTap,
    super.key,
  });

  final String title;
  final List<AppModel> items;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HomeTitle(title: title),
        12.vSpace,
        AppContainer(
          onTap: onTap,
          width: double.maxFinite,
          constraints: BoxConstraints(maxHeight: 100.h),
          child:
              items.isEmpty
                  ? Text(
                    AppStrings.noDataSelected,
                    style: AppTextStyle(fontSize: 12.sp, color: Colors.black38),
                  )
                  : Wrap(
                    spacing: 12.w,
                    runSpacing: 4.h,
                    clipBehavior: Clip.antiAlias,
                    children:
                        items.map((item) {
                          return Text(
                            '◆ ${item.name}',
                            style: AppTextStyle(fontSize: 13.sp),
                          );
                        }).toList(),
                  ),
        ),
      ],
    );
  }
}
