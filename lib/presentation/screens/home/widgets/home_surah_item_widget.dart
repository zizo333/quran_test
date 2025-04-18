import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_test/core/constants/app_strings.dart';
import 'package:quran_test/core/injections/di_imports.dart';
import 'package:quran_test/core/utilities/app_functions.dart';
import 'package:quran_test/data/models/app_model.dart';
import 'package:quran_test/presentation/cubit/home/home_cubit.dart';
import 'package:quran_test/presentation/cubit/surah/surah_cubit.dart';
import 'package:quran_test/presentation/dialogs/surah_list_dialog.dart';
import 'package:quran_test/presentation/screens/home/widgets/home_item_widget.dart';

class HomeSurahItemWidget extends StatelessWidget {
  const HomeSurahItemWidget({required this.surahList, super.key});

  final List<AppModel> surahList;

  @override
  Widget build(BuildContext context) {
    return HomeItemWidget(
      title: AppStrings.chooseSurah,
      items: surahList,
      onTap: () {
        AppFunctions.showAppDialog<void>(
          context,
          child: BlocProvider<SurahCubit>(
            create: (context) => sl<SurahCubit>()..getSurahList(surahList),
            child: SurahListDialog(
              onConfirm: (surahList) {
                context.read<HomeCubit>().setSurahList(surahList);
              },
            ),
          ),
        );
      },
    );
  }
}
