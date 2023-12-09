//Author: Purushotham
//Created On: 09-12-2023

part of '../dashboard_screen.dart';

class _EmptySavingsGoalsWidget extends StatelessWidget {
  const _EmptySavingsGoalsWidget();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Colors.teal.withOpacity(0.2),
          Colors.teal.withOpacity(0.1),
          Colors.teal.withOpacity(0.0),
        ], begin: Alignment.bottomLeft, end: Alignment.topRight),
      ),
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(UIConstants.screenPadding),
              child: SvgPicture.asset(
                AssetsPath.emptySavingGoals,
                height: context.screenSize.height.percentageOf(50),
              ),
            ),
          ),
          Material(
              color: Colors.white54,
              borderRadius: const BorderRadius.all(Radius.circular(UIConstants.borderRadius)),
              child: ScreenPadding(
                  child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "No Goals Found",
                    style: context.textTheme.headlineSmall,
                    textAlign: TextAlign.center,
                  ),
                  const Divider(),
                  Text(
                    StringConstants.emptySavingsGoals,
                    style: context.textTheme.labelLarge,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(width: 0, height: 5),
                  FelloButton.elevatedIcon(
                    label: "Create Savings Goal",
                    icon: Icons.add,
                    onPressed: () => createGoal(context),
                  )
                ],
              ))),
        ],
      ),
    );
  }

  void createGoal(BuildContext context) {
    context.navigateTo(const AddSavingsGoals()).then((value) {
      if(value == true){
        context.showSnackbar(child: const Text(StringConstants.successGoalCreation));
      }
    });
  }
}
