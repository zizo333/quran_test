import 'package:flutter/material.dart';
import 'package:quran_test/core/responsive/context_extension.dart';

class OrientationLayout extends StatelessWidget {
  const OrientationLayout({required this.portrait, this.landscape, super.key});

  final Widget portrait;
  final Widget? landscape;

  @override
  Widget build(BuildContext context) {
    return context.orientation == Orientation.portrait
        ? portrait
        : landscape ?? portrait;
  }
}
