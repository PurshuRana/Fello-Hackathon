//Author: Purushotham
//Created On: 09-12-2023

enum SavingsGoalFrequency {
  daily("Daily"),
  weekly("Weekly"),
  montly("Montly"),
  yearly("Yearly");

  const SavingsGoalFrequency(this.label);
  final String label;

  static SavingsGoalFrequency parseString(String text) {
    return switch (text) {
      "Daily" => SavingsGoalFrequency.daily,
      "Weekly" => SavingsGoalFrequency.weekly,
      "Montly" => SavingsGoalFrequency.montly,
      "Yearly" => SavingsGoalFrequency.yearly,
      _ => SavingsGoalFrequency.daily,
    };
  }
}

enum SavingsGoalPriority {
  high("High"),
  medium("Medium"),
  low("Low");

  const SavingsGoalPriority(this.label);
  final String label;

  static SavingsGoalPriority parseString(String text) {
    return switch (text) {
      "High" => SavingsGoalPriority.high,
      "Medium" => SavingsGoalPriority.medium,
      "Low" => SavingsGoalPriority.low,
      _ => SavingsGoalPriority.low,
    };
  }
}
