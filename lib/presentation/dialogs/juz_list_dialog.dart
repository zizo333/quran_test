import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_test/core/constants/app_sizes.dart';
import 'package:quran_test/core/constants/app_strings.dart';
import 'package:quran_test/core/extensions/context_extension.dart';
import 'package:quran_test/data/models/app_model.dart';
import 'package:quran_test/presentation/cubit/juz/juz_cubit.dart';
import 'package:quran_test/presentation/dialogs/base_dialog.dart';
import 'package:quran_test/presentation/widgets/app_button.dart';
import 'package:quran_test/presentation/widgets/app_check_box.dart';

class JuzListDialog extends StatelessWidget {
  const JuzListDialog({required this.onConfirm, super.key});

  final void Function(List<AppModel> juzList) onConfirm;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<JuzCubit, JuzState>(
      builder: (context, state) {
        return BaseDialog(
          padding: EdgeInsets.zero,
          header: DialogCheckBoxHeader(
            title: AppStrings.selectAll,
            isChecked: context.read<JuzCubit>().isAllSelected(),
            onTap: context.read<JuzCubit>().selectAll,
          ),
          child: Column(
            children: [
              Expanded(
                child: ListView.separated(
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) {
                    final juz = state.juzList[index];
                    return AppCheckBox(
                      onChanged: (_) {
                        context.read<JuzCubit>().selectJuz(
                          state.juzList[index],
                        );
                      },
                      title: juz.name,
                      isChecked: context.read<JuzCubit>().isJuzSelected(juz),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const Divider(height: 0);
                  },
                  itemCount: state.juzList.length,
                ),
              ),
              Padding(
                padding: AppSizes.checkBoxPadding,
                child: AppButton(
                  onPressed: () {
                    onConfirm(state.selectedJuzList);
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
