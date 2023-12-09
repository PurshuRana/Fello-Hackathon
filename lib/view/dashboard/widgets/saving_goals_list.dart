part of '../dashboard_screen.dart';

//Author: Purushotham
//Created On: 09-12-2023

class _SavingsGoalsList extends StatefulWidget {
  const _SavingsGoalsList();

  @override
  State<_SavingsGoalsList> createState() => __SavingsGoalsListState();
}

class __SavingsGoalsListState extends State<_SavingsGoalsList> {
  

  @override
  Widget build(BuildContext context) {
    return BlocSelector<SavingGoalsCubit, SavingGoalsState, List<SavingGoal>>(
      selector: (state) {
        return (state as HasSavingGoals).savingGoals;
      },
      builder: (context, savingGoals) {
        return ListView.builder(
          itemCount: savingGoals.length,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            final savingGoal = savingGoals.elementAt(index);
            return _SavingGoalItemWidget(savingGoal);
          },
        );
      },
    );
  }
}
