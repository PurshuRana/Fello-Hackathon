//Author: Purushotham
//Created On: 09-12-2023

import 'package:fello_hackathan/blocs/dashboard/savings_goals/saving_goals_cubit.dart';
import 'package:fello_hackathan/constants/string_constants.dart';
import 'package:fello_hackathan/data/dashboard/models/saving_goal_model.dart';
import 'package:fello_hackathan/utils/enums.dart';
import 'package:fello_hackathan/utils/mixins.dart';
import 'package:fello_hackathan/view/widgets/buttons.dart';
import 'package:fello_hackathan/view/widgets/padding_widget.dart';
import 'package:fello_hackathan/view/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddSavingsGoals extends StatefulWidget {
  const AddSavingsGoals({super.key});

  @override
  State<AddSavingsGoals> createState() => _AddSavingsGoalsState();
}

class _AddSavingsGoalsState extends State<AddSavingsGoals> with ValidationsMixin {
  final TextEditingController goalNameController = TextEditingController();
  final TextEditingController goalAmountController = TextEditingController();
  final TextEditingController goalTargetDateController = TextEditingController();
  final TextEditingController goalStartDateController = TextEditingController();
  final TextEditingController amountSavedController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  ValueNotifier<SavingsGoalFrequency> frquencyNotifier = ValueNotifier<SavingsGoalFrequency>(SavingsGoalFrequency.montly);

  @override
  void dispose() {
    amountSavedController.dispose();
    goalStartDateController.dispose();
    goalTargetDateController.dispose();
    goalAmountController.dispose();
    goalNameController.dispose();
    frquencyNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Savings Goal"),
      ),
      body: ScreenPadding(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                FelloTextFieldWidget(
                  controller: goalNameController,
                  validator: validateGoalName,
                  label: StringConstants.goalNameLabel,
                  hint: "Car, Bike, ..",
                ),
                const SizedBox(width: 0, height: 16),
                FelloTextFieldWidget(
                  controller: goalAmountController,
                  validator: validateGoalAmount,
                  label: StringConstants.goalAmountLabel,
                  hint: "10,0000",
                  textInputType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                ),
                const SizedBox(width: 0, height: 16),
                FelloTextFieldWidget(
                  controller: goalTargetDateController,
                  validator: validateGoalDate,
                  label: StringConstants.goaltargetDateLabel,
                  hint: "DD-MM-YYYY",
                  textInputType: TextInputType.datetime,
                ),
                const SizedBox(width: 0, height: 16),
                FelloTextFieldWidget(
                  controller: goalStartDateController,
                  validator: validateGoalStartDate,
                  label: StringConstants.goalStartDateLabel,
                  hint: "DD-MM-YYYY",
                  textInputType: TextInputType.datetime,
                ),
                const SizedBox(width: 0, height: 16),
                const Text("Set Your Goal Frequency"),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    for (var frequency in SavingsGoalFrequency.values)
                      ValueListenableBuilder<SavingsGoalFrequency>(
                          valueListenable: frquencyNotifier,
                          builder: (context, __, _) {
                            return ChoiceChip(
                              label: Text(
                                frequency.label,
                              ),
                              color: MaterialStatePropertyAll(frquencyNotifier.value == frequency ? Colors.teal : Colors.transparent),
                              selected: frquencyNotifier.value == frequency,
                              onSelected: (value) {
                                frquencyNotifier.value = frequency;
                              },
                            );
                          })
                  ],
                ),
                const SizedBox(width: 0, height: 16),
                FelloButton(
                  label: "Create Goal",
                  onPressed: createGoal,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void createGoal() async {
    if (!(_formKey.currentState?.validate() ?? false)) return;
    final goal = SavingGoal(
      goalName: goalNameController.text,
      goalAmount: int.parse(goalAmountController.text).toDouble(),
      targetDate: goalTargetDateController.text,
      startDateDate: goalStartDateController.text,
      goalFrequency: frquencyNotifier.value,
      goalPriority: SavingsGoalPriority.high,
      amountSaved: 0,
    );
    context.read<SavingGoalsCubit>().addGoal(goal);
    Navigator.pop(context, true);
  }
}
