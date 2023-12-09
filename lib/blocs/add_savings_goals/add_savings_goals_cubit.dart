
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'add_savings_goals_state.dart';

class AddSavingsGoalsCubit extends Cubit<AddSavingsGoalsState> {
  AddSavingsGoalsCubit() : super(AddSavingsGoalsInitial());
}
