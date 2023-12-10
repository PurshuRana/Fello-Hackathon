//Author: Purushotham
//Created On: 09-12-2023

part of '../dashboard_screen.dart';

class _SavingGoalItemWidget extends StatelessWidget {
  const _SavingGoalItemWidget(this.savingGoal);
  final SavingGoal savingGoal;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.orange.withOpacity(0.2),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12), side: const BorderSide(color: Colors.grey, width: 0.7)),
      child: ScreenPadding(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              savingGoal.goalName,
              style: context.textTheme.headlineSmall,
            ),
            const Divider(
              height: UIConstants.screenPadding,
            ),
            Text(
              "₹${savingGoal.amountSaved} out of ₹${savingGoal.goalAmount}",
              style: context.textTheme.headlineLarge?.copyWith(fontSize: 18,color: Colors.amber),
            ),
            const SizedBox(width: 0, height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(child: Text(savingGoal.startDateDate)),
                _SavingPriorityWidget(
                  priority: savingGoal.goalPriority,
                ),
              ],
            ),
            const SizedBox(width: 0, height: 8),
            const _GoalItemActionsWidget(),
          ],
        ),
      ),
    );
  }
}

class _SavingPriorityWidget extends StatelessWidget {
  const _SavingPriorityWidget({required this.priority});
  final SavingsGoalPriority priority;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.5,
      color: switch (priority) {
        SavingsGoalPriority.high => Colors.red.shade50,
        SavingsGoalPriority.medium => Colors.blue.shade50,
        SavingsGoalPriority.low => Colors.green.shade50,
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2),
        child: Text(priority.label),
      ),
    );
  }
}

class _GoalItemActionsWidget extends StatelessWidget {
  const _GoalItemActionsWidget();

  @override
  Widget build(BuildContext context) {
    return const Row(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.spaceEvenly, mainAxisSize: MainAxisSize.max, children: [
      _ActionButton(
        icon: Icons.info,
      ),
      _ActionButton(
        icon: Icons.edit,
      ),
      _ActionButton(
        icon: Icons.add,
      ),
    ]);
  }
}

class _ActionButton extends StatelessWidget {
  const _ActionButton({required this.icon});
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(UIConstants.borderRadius)),
      // color: ,
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Icon(
          icon,
          size: 22,
          // color: context.appDarkColor,
        ),
      ),
    );
  }
}
