import 'package:exercise/exercise_screen/bloc/exercise_bloc.dart';
import 'package:exercise/exercise_screen/component/dot_set.dart';
import 'package:exercise/exercise_screen/exercise_provider.dart';
import 'package:exercise/resource/constants.dart';
import 'package:exercise/resource/screen_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

class ExerciseView extends StatefulWidget {
  const ExerciseView({Key? key}) : super(key: key);

  @override
  State<ExerciseView> createState() => _ExerciseViewState();
}

class _ExerciseViewState extends State<ExerciseView> {
  final _eBloc = ExerciseBloc();

  @override
  void initState() {
    super.initState();
    _eBloc.add(PaintDot());
  }

  @override
  Widget build(BuildContext context) {
    var exerciseProvider = Provider.of<ExerciseProvider>(context, listen: true);
    SizeConfig().init(context);
    return BlocListener<ExerciseBloc, ExerciseState>(
      bloc: _eBloc,
      listener: (context, state) {
        if (state is CurrentIndexChanged) {
          exerciseProvider.setCurrentIndex(state.index!);
          exerciseProvider.startTimer();
          Future.delayed(const Duration(microseconds: kDotColorChangeInterval),
              () {
            if (exerciseProvider.timer.elapsed.inSeconds ==
                kPredifinedRunTimeSeconds) {
              exerciseProvider.calculateAverageReactionTime();
            }
            if (exerciseProvider.timer.isActive) _eBloc.add(PaintDot());
          });
        }

        if (state is PainterStopped) {
          exerciseProvider.pauseTimer();
          exerciseProvider.setExerciseState(isPaused: true);
          if (!exerciseProvider.timer.isExpired) _eBloc.add(DelayPainter());
        }

        if (state is DelayCompleted) {
          _eBloc.add(PaintDot());

          exerciseProvider.sumTotalPauseTime(state.delayTime!);
          exerciseProvider.setExerciseState(isPaused: false);
          if (exerciseProvider.timer.elapsed.inSeconds ==
              kPredifinedRunTimeSeconds) {
            exerciseProvider.resetTimer();
          } else {
            exerciseProvider.startTimer();
          }
        }
      },
      child: Scaffold(
        body: SizedBox(
          height: SizeConfig.screenHeight,
          width: SizeConfig.screenWidth,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              'Overall Average Reaction Time => ${exerciseProvider.averageReactionTime}s',
              textScaleFactor: getTextScaleFactor(),
            ).visible(exerciseProvider.timer.isExpired),
            20.height,
            const DotSet(
              indexValueOne: 0,
              indexValueTwo: 1,
              indexValueThree: 2,
            ).paddingOnly(
                left: getProportionateScreenWidth(0),
                bottom: getProportionateScreenHeight(10)),
            const DotSet(
              indexValueOne: 3,
              indexValueTwo: 4,
              indexValueThree: 5,
            ).paddingOnly(
                left: getProportionateScreenWidth(120),
                bottom: getProportionateScreenHeight(10)),
            const DotSet(
              indexValueOne: 6,
              indexValueTwo: 7,
              indexValueThree: 8,
            ).paddingOnly(
                left: getProportionateScreenWidth(0),
                bottom: getProportionateScreenHeight(10)),
            const DotSet(
              indexValueOne: 9,
              indexValueTwo: 10,
              indexValueThree: 11,
            ).paddingOnly(
                left: getProportionateScreenWidth(120),
                bottom: getProportionateScreenHeight(10)),
          ]),
        ).onTap(() {
          if (!exerciseProvider.isExercisePaused) _eBloc.add(StopPainter());
        }),
      ),
    );
  }
}
