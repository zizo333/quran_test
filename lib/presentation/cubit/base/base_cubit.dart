import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_test/presentation/cubit/base/base_data.dart';

abstract class BaseCubit<S, T extends BaseData> extends Cubit<S> {
  BaseCubit(super.initialState, this.data);

  final T data;
}
