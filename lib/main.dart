import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_test/core/injections/di_imports.dart';
import 'package:quran_test/core/utilities/app_functions.dart';
import 'package:quran_test/core/utilities/my_bloc_observer.dart';
import 'package:quran_test/presentation/my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppFunctions.setPreferredOrientations();
  AppFunctions.changeStatusBarIconColors();
  await initInjection();

  if (kDebugMode) {
    Bloc.observer = MyBlocObserver();
  }

  runApp(const MyApp());
}
