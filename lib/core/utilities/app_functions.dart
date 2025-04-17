import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran_test/core/constants/app_sizes.dart';

class AppFunctions {
  AppFunctions._();

  static Future<void> setPreferredOrientations() async {
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  static void changeStatusBarIconColors() {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarIconBrightness: Brightness.dark),
    );
  }

  static void unFocusKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  static Future<T?> showAppDialog<T>(
    BuildContext context, {
    required Widget child,
    Color? bgColor,
    bool barrierDismissible = true,
  }) {
    return showDialog<T>(
      context: context,
      barrierColor: bgColor ?? Colors.black38,
      barrierDismissible: barrierDismissible,
      builder: (context) {
        return PopScope(canPop: barrierDismissible, child: child);
      },
    );
  }

  static Future<void> showBottomSheet({
    required BuildContext context,
    required Widget child,
    Color? backgroundColor,
  }) async {
    return showModalBottomSheet<void>(
      context: context,
      constraints: const BoxConstraints(minWidth: double.infinity),
      isScrollControlled: true,
      backgroundColor: backgroundColor ?? Colors.white,
      elevation: AppSizes.elevation.r,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppSizes.bottomSheetRadius.r),
        ),
      ),
      builder: (context) => child,
    );
  }

  static Duration get duration150ms => const Duration(milliseconds: 150);
  static Duration get duration300ms => const Duration(milliseconds: 300);
  static Duration get duration500ms => const Duration(milliseconds: 500);
  static Duration get duration1s => const Duration(seconds: 1);
  static Duration get duration2s => const Duration(seconds: 2);
  static Duration get duration3s => const Duration(seconds: 3);
  static Duration get duration1m => const Duration(minutes: 1);
  static Duration get duration365d => const Duration(days: 365);

  static FilteringTextInputFormatter get decimalNumberFormatter =>
      FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*'));

  static FilteringTextInputFormatter get intNumberFormatter =>
      FilteringTextInputFormatter.allow(RegExp(r'^\d*?\d*'));

  // static void handleCubitListener(
  //   BuildContext context, {
  //   required RequestState requestState,
  //   required String message,
  //   String? loadingMessage,
  //   VoidCallback? onLoaded,
  //   VoidCallback? onError,
  // }) {
  //   if (requestState.isLoading()) {
  //     showAppDialog<void>(
  //       context,
  //       barrierDismissible: false,
  //       child: AppLoading.submit(message: loadingMessage),
  //     );
  //   } else if (requestState.hasError()) {
  //     context.closeDialogIfOppened();
  //     showToast(message);
  //     onError?.call();
  //   } else if (requestState.isLoaded()) {
  //     context.closeDialogIfOppened();
  //     onLoaded?.call();
  //   }
  // }
}

void showLog(Object? object, [String? title]) {
  if (kDebugMode) {
    print('\n👉 ${title != null ? '$title: ' : ''} $object\n');
  }
}
