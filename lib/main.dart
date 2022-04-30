import 'package:exercise/exercise_screen/bloc/exercise_bloc.dart';
import 'package:exercise/exercise_screen/exercise_provider.dart';
import 'package:exercise/exercise_screen/exercise_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initialize();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BeyondDialog Exercise ',
      debugShowCheckedModeBanner: false,
      home: BlocProvider<ExerciseBloc>(
        create: (context) => ExerciseBloc(),
        child: ChangeNotifierProvider(
          create:(_)=>ExerciseProvider() , 
          child:const ExerciseView()),
      ),
    );
  }
}
