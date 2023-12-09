
import 'package:equatable/equatable.dart';
import 'package:fello_hackathan/data/dashboard/models/saving_goal_model.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'saving_goals_state.dart';

//Author: Purushotham
//Created On: 09-12-2023

class SavingGoalsCubit extends HydratedCubit<SavingGoalsState> {
  SavingGoalsCubit() : super(NoSavingGoals());

  void addGioal(SavingGoal goal) {
    switch (state) {
      case NoSavingGoals():
        emit(HasSavingGoals(savingGoals: [goal]));

      case HasSavingGoals():
      emit(HasSavingGoals(savingGoals: [goal,...(state as HasSavingGoals).savingGoals]));
    }
  }

  @override
  SavingGoalsState? fromJson(Map<String, dynamic> json) {
    return state.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(SavingGoalsState state) {
    return state.toJson();
  }
}
