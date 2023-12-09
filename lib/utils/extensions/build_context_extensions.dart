//Author: Purushotham
//Created On: 09-12-2023

import 'dart:async';

import 'package:fello_hackathan/constants/string_constants.dart';
import 'package:fello_hackathan/constants/ui_constants.dart';
import 'package:fello_hackathan/view/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';

extension BuildContextExtensions on BuildContext {
  Size get screenSize => MediaQuery.sizeOf(this);
  Orientation get screenOreintation => MediaQuery.orientationOf(this);

  TextTheme get textTheme => Theme.of(this).textTheme;

  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  Future<dynamic> navigateTo(Widget child) async {
    if (!mounted) return;
    return Navigator.push(
        this,
        MaterialPageRoute(
          builder: (context) => child,
        ));
  }

  Future<dynamic> pushReplacementTo(Widget child) async {
    if (!mounted) return;
    return Navigator.pushReplacement(
        this,
        MaterialPageRoute(
          builder: (context) => child,
        ));
  }

  void back() {
    if (!mounted) return;
    Navigator.pop(this);
  }

  void home() {
    if (!mounted) return;
    Navigator.pushAndRemoveUntil(this, MaterialPageRoute(
      builder: (context) {
        return const OnBoardingScreen();
      },
    ), (route) => false);
  }

  FutureOr<dynamic> showModelBottomSheet(Widget child, {bool isScrollControlled = false}) {
    if (!mounted) return null;
    return showModalBottomSheet(
      context: this,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(25), topRight: Radius.circular(25))),
      enableDrag: false,
      useSafeArea: true,
      isDismissible: true,
      showDragHandle: false,
      isScrollControlled: isScrollControlled,
      constraints: BoxConstraints(
        maxHeight: MediaQuery.sizeOf(this).height / 1.05,
      ),
      builder: (context) {
        return child;
      },
    );
  }

  void showSnackbar({String? message, Widget? child, Color? bgColor}) {
    if (!mounted) return;
    ScaffoldMessenger.maybeOf(this)?.clearSnackBars();
    ScaffoldMessenger.of(this).showSnackBar(SnackBar(
      content: child ??
          Text(
            message ?? StringConstants.errorMsg,
            textAlign: TextAlign.center,
          ),
      margin: const EdgeInsets.all(8),
      behavior: SnackBarBehavior.floating,
      backgroundColor: bgColor,
      duration: UIConstants.snakBarDuration,
    ));
  }

  void clearSneakBar() {
    if (!mounted) return;
    ScaffoldMessenger.maybeOf(this)?.clearSnackBars();
  }

  void showErrorSnackbar({String? message, Widget? child}) {
    if (!mounted) return;
    ScaffoldMessenger.maybeOf(this)?.clearSnackBars();
    ScaffoldMessenger.of(this).showSnackBar(SnackBar(
      content: child ??
          Text(
            message ?? StringConstants.errorMsg,
            textAlign: TextAlign.center,
          ),
      margin: const EdgeInsets.all(8),
      behavior: SnackBarBehavior.floating,
      backgroundColor: UIConstants.errorColor,
      duration: UIConstants.snakBarDuration,
    ));
  }

  void removePrimaryFocus() {
    FocusManager.instance.primaryFocus?.unfocus();
  }
}
