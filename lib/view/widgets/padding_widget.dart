import 'package:fello_hackathan/constants/ui_constants.dart';
import 'package:flutter/material.dart';

///Author: Purushotham
///Created On: 09-12-2023

class ScreenPadding extends StatelessWidget {
  const ScreenPadding({super.key, required this.child,}): padding = const EdgeInsets.all( UIConstants.screenPadding);
  const ScreenPadding.horizontal({super.key, required this.child}): padding = const EdgeInsets.symmetric(horizontal :UIConstants.screenPadding);
  const ScreenPadding.vertical({super.key, required this.child}): padding = const EdgeInsets.symmetric(horizontal :UIConstants.screenPadding);

  final EdgeInsets padding;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: child,
    );
  }
}
