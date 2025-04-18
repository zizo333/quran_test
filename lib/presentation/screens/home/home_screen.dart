import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran_test/core/constants/app_sizes.dart';
import 'package:quran_test/core/constants/app_strings.dart';
import 'package:quran_test/core/extensions/context_extension.dart';
import 'package:quran_test/core/extensions/num_extenison.dart';
import 'package:quran_test/core/injections/di_imports.dart';
import 'package:quran_test/core/utilities/app_functions.dart';
import 'package:quran_test/presentation/cubit/home/home_cubit.dart';
import 'package:quran_test/presentation/cubit/juz/juz_cubit.dart';
import 'package:quran_test/presentation/cubit/surah/surah_cubit.dart';
import 'package:quran_test/presentation/dialogs/juz_list_dialog.dart';
import 'package:quran_test/presentation/dialogs/surah_list_dialog.dart';
import 'package:quran_test/presentation/screens/home/widgets/home_item_widget.dart';
import 'package:quran_test/presentation/screens/home/widgets/home_juz_item_widget.dart';
import 'package:quran_test/presentation/screens/home/widgets/home_pages.dart';
import 'package:quran_test/presentation/screens/home/widgets/home_surah_item_widget.dart';
import 'package:quran_test/presentation/widgets/app_bar_widget.dart';
import 'package:quran_test/presentation/widgets/app_button.dart';
import 'package:quran_test/presentation/widgets/app_scaffold.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: const AppBarWidget(title: AppStrings.testQuran),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: AppSizes.screenPadding,
              child: BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  return Column(
                    children: [
                      HomeSurahItemWidget(surahList: state.surahList),
                      AppSizes.inset.vSpace,
                      HomeJuzItemWidget(juzList: state.juzList),
                      AppSizes.inset.vSpace,
                      const HomePages(),
                    ],
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: AppSizes.screenPadding,
            child: SafeArea(
              child: Row(
                children: [
                  Expanded(
                    child: AppButton(
                      text: AppStrings.startTest,
                      onPressed: () {},
                    ),
                  ),
                  AppSizes.inset.hSpace,
                  Expanded(
                    child: AppButton(text: AppStrings.reset, onPressed: () {}),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
