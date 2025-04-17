import 'package:get_it/get_it.dart';
import 'package:quran_test/core/services/shared_preferences_log.dart';
import 'package:quran_test/core/utilities/shared_data.dart';
import 'package:quran_test/data/datasources/quran_data_source.dart';
import 'package:quran_test/data/repos/quran_repo.dart';
import 'package:quran_test/data/usecases/get_juz_list_use_case.dart';
import 'package:quran_test/data/usecases/get_surah_list_use_case.dart';
import 'package:quran_test/presentation/cubit/home/home_cubit.dart';
import 'package:quran_test/presentation/cubit/juz/juz_cubit.dart';
import 'package:quran_test/presentation/cubit/surah/surah_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'cubits.dart';
part 'datasources.dart';
part 'di.dart';
part 'repos.dart';
part 'usecases.dart';
