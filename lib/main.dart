import 'package:fello_hackathan/blocs/dashboard/savings_goals/saving_goals_cubit.dart';
import 'package:fello_hackathan/utils/extensions/build_context_extensions.dart';
import 'package:fello_hackathan/view/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';


///Author: Purushotham
///Created On: 09-12-2023

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
   HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getTemporaryDirectory(),
  );
  runApp(const FelloHackathan());
}

class FelloHackathan extends StatelessWidget {
  const FelloHackathan({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      lazy: false,
      create: (BuildContext context) => SavingGoalsCubit(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
          useMaterial3: true,
          appBarTheme: AppBarTheme(
            backgroundColor: context.colorScheme.primary.withOpacity(0.4)
          )
        ),
        debugShowCheckedModeBanner: false,
        home: const OnBoardingScreen(),
      ),
    );
  }
}


