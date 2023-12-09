mixin ValidationsMixin {
  String? validateGoalName(String? text) {
    if (text?.isEmpty ?? true) {
      return "Please provide a Name for this Goal";
    }
    return null;
  }

  String? validateGoalAmount(String? text) {
    if (text?.isEmpty ?? true) {
      return "Please provide Total Amount for this Goal";
    }
    return null;
  }

  String? validateGoalDate(String? text) {
     if (text?.isEmpty ?? true) {
      return "Please select the target date for this Goal";
    }
    return null;
  }

  String? validateGoalStartDate(String? text) {
     if (text?.isEmpty ?? true) {
      return "Please select the start date for this Goal";
    }
    return null;
  }
}
