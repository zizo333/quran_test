import 'package:flutter/material.dart';
import 'package:quran_test/core/constants/app_media.dart';
import 'package:quran_test/core/extensions/context_extension.dart';
import 'package:quran_test/presentation/widgets/app_bar_icon.dart';

class BackIcon extends StatelessWidget {
  const BackIcon({super.key, this.onPressed});

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return AppBarIcon(onPressed: onPressed ?? context.pop, icon: AppSvgs.arrow);
  }
}
