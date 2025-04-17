import 'package:flutter/material.dart';
import 'package:quran_test/core/utilities/app_functions.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({
    required this.body,
    super.key,
    this.backgroundColor,
    this.drawer,
    this.appBar,
    this.bottomNavigationBar,
    this.padding = EdgeInsets.zero,
    this.resizeToAvoidBottomInset,
    this.floatingActionButton,
    this.onTap,
  });

  final Color? backgroundColor;
  final Widget? drawer;
  final PreferredSizeWidget? appBar;
  final Widget body;
  final Widget? bottomNavigationBar;
  final EdgeInsetsGeometry padding;
  final bool? resizeToAvoidBottomInset;
  final VoidCallback? onTap;
  final Widget? floatingActionButton;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? AppFunctions.unFocusKeyboard,
      child: Scaffold(
        backgroundColor: backgroundColor,
        resizeToAvoidBottomInset: resizeToAvoidBottomInset,
        drawer: drawer,
        appBar: appBar,
        body: Padding(padding: padding, child: body),
        bottomNavigationBar: bottomNavigationBar,
        floatingActionButton: floatingActionButton,
      ),
    );
  }
}
