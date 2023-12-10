mixin ValidationsMixin {
  static RegExp dateRegx = RegExp(r'^[0-3]?[0-9]-[01]?[0-9]-\d{4}$');
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
    } else if (!dateRegx.hasMatch(text!)) {
      return "Invalid Date Format";
    }
    return null;
  }

  String? validateGoalStartDate(String? text) {
    if (text?.isEmpty ?? true) {
      return "Please select the start date for this Goal";
    } else if (!dateRegx.hasMatch(text!)) {
      return "Invalid Date Format";
    }
    return null;
  }
}
