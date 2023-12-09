//Author: Purushotham
//Created On: 09-12-2023

import 'package:fello_hackathan/blocs/dashboard/savings_goals/saving_goals_cubit.dart';
import 'package:fello_hackathan/constants/string_constants.dart';
import 'package:fello_hackathan/utils/enums.dart';
import 'package:fello_hackathan/view/add_savigs_goals/add_savings_goals.dart';
import 'package:fello_hackathan/view/widgets/padding_widget.dart';
import 'package:flutter/material.dart';
import 'package:fello_hackathan/constants/assets_path.dart';
import 'package:fello_hackathan/constants/ui_constants.dart';
import 'package:fello_hackathan/utils/extensions/build_context_extensions.dart';
import 'package:fello_hackathan/utils/extensions/num_extensions.dart';
import 'package:fello_hackathan/view/widgets/buttons.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fello_hackathan/data/dashboard/models/saving_goal_model.dart';

part 'widgets/empty_saving_goals.dart';
part 'widgets/saving_goals_list.dart';
part 'widgets/saving_goal_item.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: BlocBuilder<SavingGoalsCubit, SavingGoalsState>(
        builder: (context, savingGoalsState) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("Hello Welcome"),
            ),
            body: switch (savingGoalsState) {
              NoSavingGoals() => const _EmptySavingsGoalsWidget(),
              HasSavingGoals() => const _SavingsGoalsList(),
            },
            floatingActionButton: savingGoalsState is NoSavingGoals ? null : FloatingActionButton.extended(onPressed: () => createGoal(context), label: const Text("Create Savings Goal")),
          );
        },
      ),
    );
  }
  void createGoal(BuildContext context) {
    context.navigateTo(const AddSavingsGoals()).then((value) {
      if(value == true){
        context.showSnackbar(child: const Text(StringConstants.successGoalCreation));
      }
    });
  }
}
