//Author: Purushotham
//Created On: 09-12-2023

import 'package:equatable/equatable.dart';
import 'package:fello_hackathan/utils/enums.dart';

class SavingGoal extends Equatable {
  final String goalName;
  final double goalAmount;
  final String targetDate;
  final String startDateDate;
  final SavingsGoalFrequency goalFrequency;
  final SavingsGoalPriority goalPriority;
  final double amountSaved;

  const SavingGoal({required this.goalName, required this.goalAmount, required this.targetDate, required this.startDateDate, required this.goalFrequency, required this.goalPriority, required this.amountSaved});

  factory SavingGoal.fromJson(Map<String, dynamic> json) {
    return SavingGoal(
      goalName: json['goalName'],
      goalAmount: json['goalAmount'],
      targetDate: json['targetDate'],
      startDateDate: json['startDateDate'],
      goalFrequency: SavingsGoalFrequency.parseString(json['goalFrequency']),
      goalPriority: SavingsGoalPriority.parseString(json['goalPriority']),
      amountSaved: json['amountSaved'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'goalName': goalName,
      'goalAmount': goalAmount,
      'targetDate': targetDate,
      'startDateDate': startDateDate,
      'goalFrequency': goalFrequency.label,
      'goalPriority': goalPriority.label,
      'amountSaved': amountSaved,
    };
  }

  static String get stringState => 'savingGoals';

  @override
  List<Object?> get props => [
        goalName,
        goalAmount,
        targetDate,
        startDateDate,
        goalFrequency,
        goalPriority,
        amountSaved,
      ];
}
