import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_test/core/constants/app_sizes.dart';
import 'package:quran_test/core/constants/app_strings.dart';
import 'package:quran_test/core/extensions/context_extension.dart';
import 'package:quran_test/data/models/app_model.dart';
import 'package:quran_test/presentation/cubit/surah/surah_cubit.dart';
import 'package:quran_test/presentation/dialogs/base_dialog.dart';
import 'package:quran_test/presentation/widgets/app_button.dart';
import 'package:quran_test/presentation/widgets/app_check_box.dart';

class SurahListDialog extends StatelessWidget {
  const SurahListDialog({required this.onConfirm, super.key});

  final void Function(List<AppModel> surahList) onConfirm;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SurahCubit, SurahState>(
      builder: (context, state) {
        return BaseDialog(
          padding: EdgeInsets.zero,
          header: DialogCheckBoxHeader(
            title: AppStrings.selectAll,
            isChecked: context.read<SurahCubit>().isAllSelected(),
            onTap: context.read<SurahCubit>().selectAll,
          ),
          child: Column(
            children: [
              Expanded(
                child: ListView.separated(
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) {
                    final surah = state.surahList[index];
                    return AppCheckBox(
                      onChanged: (_) {
                        context.read<SurahCubit>().selectSurah(
                          state.surahList[index],
                        );
                      },
                      title: surah.name,
                      isChecked: context.read<SurahCubit>().isSurahSelected(
                        surah,
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const Divider(height: 0);
                  },
                  itemCount: state.surahList.length,
                ),
              ),
              Padding(
                padding: AppSizes.checkBoxPadding,
                child: AppButton(
                  onPressed: () {
                    onConfirm(state.selectedSurahList);
                    Navigator.of(context).pop();
                  },
                  text: AppStrings.confirm,
                  textColor: Colors.white,
                  backgroundColor: context.colorScheme.primary,
                  borderColor: context.colorScheme.primary,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
