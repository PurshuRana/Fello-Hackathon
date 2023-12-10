import 'package:equatable/equatable.dart';
import 'package:fello_hackathan/data/dashboard/models/saving_goal_model.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'saving_goals_state.dart';

//Author: Purushotham
//Created On: 09-12-2023

class SavingGoalsCubit extends HydratedCubit<SavingGoalsState> {
  SavingGoalsCubit() : super(NoSavingGoals());

  void addGoal(SavingGoal goal) {
    switch (state) {
      case NoSavingGoals():
        emit(HasSavingGoals(savingGoals: [goal]));

      case HasSavingGoals():
        emit(HasSavingGoals(savingGoals: [goal, ...(state as HasSavingGoals).savingGoals]));
    }
  }

  @override
  SavingGoalsState? fromJson(Map<String, dynamic> json) {
    
     if (json['state'] == HasSavingGoals.stringState) {
      final goalsJsonData = json['goals'];
      return HasSavingGoals(savingGoals: List.generate(goalsJsonData.length, (index) => SavingGoal.fromJson(goalsJsonData.elementAt(index))));
    } else {
      return NoSavingGoals();
    }
    // return HasSavingGoals(savingGoals: [SavingGoal(goalName: "Audi", goalAmount: 989888, targetDate: "01-01-2024", startDateDate: "01-01-2026", goalFrequency: SavingsGoalFrequency.montly, goalPriority: SavingsGoalPriority.low, amountSaved: 2545)]);
  }

  @override
  Map<String, dynamic>? toJson(SavingGoalsState state) {
    return state.toJson();
  }
}
