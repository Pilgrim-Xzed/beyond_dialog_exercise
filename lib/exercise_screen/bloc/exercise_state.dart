part of 'exercise_bloc.dart';

abstract class ExerciseState {
  const ExerciseState();
 
}

class ExerciseInitial extends ExerciseState {}

class CurrentIndexChanged extends ExerciseState{
  final int? index;
  const CurrentIndexChanged({this.index});
}

class PainterStopped extends ExerciseState{}

class DelayCompleted extends ExerciseState{
  final int? delayTime;
  const DelayCompleted({this.delayTime});
}