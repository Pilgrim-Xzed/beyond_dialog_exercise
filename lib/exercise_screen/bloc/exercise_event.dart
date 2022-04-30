part of 'exercise_bloc.dart';

abstract class ExerciseEvent{
  const ExerciseEvent();

  
}

// Event to change dot color 
class PaintDot extends ExerciseEvent{

}

// Event to start a timer
class StopPainter extends ExerciseEvent{

}


// Evemt to delay painter for a random time of one to ten seconds
class DelayPainter extends ExerciseEvent{
  
}