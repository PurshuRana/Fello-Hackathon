part of 'saving_goals_cubit.dart';

//Author: Purushotham
//Created On: 09-12-2023

sealed class SavingGoalsState extends Equatable {
  Map<String, dynamic>? toJson();
}

final class NoSavingGoals extends SavingGoalsState {
  @override
  List<Object?> get props => [];

  @override
  Map<String, dynamic>? toJson() {
    return {'state': stringState};
  }

  String get stringState => 'noSavingGoals';
}

final class HasSavingGoals extends SavingGoalsState {
  final List<SavingGoal> savingGoals;

  HasSavingGoals({required this.savingGoals});

  @override
  List<Object?> get props => [savingGoals];

  @override
  Map<String, dynamic>? toJson() {
    return {
      'state': stringState,
      "goals": List.generate(savingGoals.length, (index) => savingGoals.elementAt(index).toJson()),
    };
  }

  static String get stringState => 'hasSavingsGoals';
}
