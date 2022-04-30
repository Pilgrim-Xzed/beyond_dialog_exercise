import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:exercise/resource/constants.dart';




part 'exercise_event.dart';
part 'exercise_state.dart';

class ExerciseBloc extends Bloc<ExerciseEvent, ExerciseState> {
  ExerciseBloc() : super(ExerciseInitial()) {
    on<PaintDot>((event, emit) => _paintDot(event,emit));
    on<StopPainter>((event, emit) => _stopPainter(event,emit));
    on<DelayPainter>((event, emit) => _delayPainter(event,emit));
  
  }

  Random random = Random();
  
  _paintDot(PaintDot event, Emitter<ExerciseState> emit) {
    
    emit(CurrentIndexChanged(index: random.nextInt(kTotalDots)));
   }

   _stopPainter(StopPainter event, Emitter<ExerciseState> emit){
     
     emit(PainterStopped());
   }

   _delayPainter(DelayPainter event, Emitter<ExerciseState> emit)async{
     final delayTimeInSeconds = random.nextInt(10);
     await Future.delayed(Duration(seconds: delayTimeInSeconds),()=>emit(DelayCompleted(delayTime: delayTimeInSeconds)));
   }
}
