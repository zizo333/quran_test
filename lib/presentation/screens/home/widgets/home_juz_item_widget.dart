import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_test/core/constants/app_strings.dart';
import 'package:quran_test/core/injections/di_imports.dart';
import 'package:quran_test/core/utilities/app_functions.dart';
import 'package:quran_test/data/models/app_model.dart';
import 'package:quran_test/presentation/cubit/home/home_cubit.dart';
import 'package:quran_test/presentation/cubit/juz/juz_cubit.dart';
import 'package:quran_test/presentation/dialogs/juz_list_dialog.dart';
import 'package:quran_test/presentation/screens/home/widgets/home_item_widget.dart';

class HomeJuzItemWidget extends StatelessWidget {
  const HomeJuzItemWidget({required this.juzList, super.key});

  final List<AppModel> juzList;

  @override
  Widget build(BuildContext context) {
    return HomeItemWidget(
      title: AppStrings.chooseJuz,
      items: juzList,
      onTap: () {
        AppFunctions.showAppDialog<void>(
          context,
          child: BlocProvider<JuzCubit>(
            create: (context) => sl<JuzCubit>()..getJuzList(juzList),
            child: JuzListDialog(
              onConfirm: (juzList) {
                context.read<HomeCubit>().setJuzList(juzList);
              },
            ),
          ),
        );
      },
    );
  }
}
