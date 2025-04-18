import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran_test/core/constants/app_strings.dart';
import 'package:quran_test/core/extensions/num_extenison.dart';
import 'package:quran_test/core/theming/app_styles.dart';
import 'package:quran_test/core/utilities/app_functions.dart';
import 'package:quran_test/presentation/cubit/home/home_cubit.dart';
import 'package:quran_test/presentation/screens/home/widgets/home_title.dart';
import 'package:quran_test/presentation/widgets/app_text_field.dart';

class HomePages extends StatelessWidget {
  const HomePages({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HomeCubit>();
    final data = cubit.data;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const HomeTitle(title: AppStrings.selectPages),
        12.vSpace,
        Row(
          children: [
            Text(
              '${AppStrings.fromPage} : ',
              style: AppTextStyle(fontSize: 16.sp),
            ),
            SizedBox(
              width: 100.w,
              height: 45.h,
              child: AppTextField(
                controller: data.fromPageController,
                focusNode: data.fromPageNode,
                nextNode: data.toPageNode,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
                inputFormatters: [AppFunctions.intNumberFormatter],
                onTap: cubit.selectFromPageNumber,
              ),
            ),
            const Spacer(),
            Text(
              '${AppStrings.toPage} : ',
              style: AppTextStyle(fontSize: 16.sp),
            ),
            SizedBox(
              width: 100.w,
              height: 45.h,
              child: AppTextField(
                controller: data.toPageController,
                focusNode: data.toPageNode,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                inputFormatters: [AppFunctions.intNumberFormatter],
                onTap: cubit.selectToPageNumber,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
