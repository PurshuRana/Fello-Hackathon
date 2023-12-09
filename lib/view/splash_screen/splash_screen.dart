
import 'package:fello_hackathan/constants/assets_path.dart';
import 'package:fello_hackathan/constants/string_constants.dart';
import 'package:fello_hackathan/constants/ui_constants.dart';
import 'package:fello_hackathan/utils/extensions/build_context_extensions.dart';
import 'package:fello_hackathan/utils/extensions/num_extensions.dart';
import 'package:fello_hackathan/view/dashboard/dashboard_screen.dart';
import 'package:fello_hackathan/view/widgets/buttons.dart';
import 'package:fello_hackathan/view/widgets/padding_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

///Author: Purushotham
///Created On: 09-12-2023

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Colors.teal.withOpacity(0.2),
            Colors.teal.withOpacity(0.1),
            Colors.teal.withOpacity(0.0),
          ], begin: Alignment.bottomLeft, end: Alignment.topRight),
        ),
        alignment: Alignment.center,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Padding(
              padding: const EdgeInsets.all(UIConstants.screenPadding),
              child: SvgPicture.asset(
                AssetsPath.splashScreenGoal,
                height: context.screenSize.height.percentageOf(50),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Material(
                  color: Colors.white54,
                  borderRadius: const BorderRadius.all(Radius.circular(UIConstants.borderRadius)),
                  child: ScreenPadding(
                      child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        StringConstants.splashScreenMessage,
                        textAlign: TextAlign.left,
                      ),
                      const SizedBox(width: 0, height: 5),
                      FelloButton.elevatedIcon(
                        label: "Lets Save",
                        icon: Icons.arrow_forward,
                        onPressed: onLetsGo,
                      )
                    ],
                  ))),
            ),
          ],
        ),
      ),
    );
  }

  void onLetsGo() {
    context.pushReplacementTo(const DashboardScreen());
  }
}
