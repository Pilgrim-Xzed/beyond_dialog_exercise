import 'package:exercise/resource/constants.dart';
import 'package:exercise/resource/utils.dart';
import 'package:flutter/foundation.dart';
import 'package:pausable_timer/pausable_timer.dart';

class ExerciseProvider extends ChangeNotifier {
  int? currentIndex;
  int totalDelayTime = 0;
  double averageReactionTime = 0;
  PausableTimer timer =
      PausableTimer(const Duration(seconds: kPredifinedRunTimeSeconds), () {});
  bool isExercisePaused = false;

  void sumTotalPauseTime(int val) {
    if (timer.elapsed.inSeconds != kPredifinedRunTimeSeconds) {
      totalDelayTime += val;
    }

    notifyListeners();
  }

  void startTimer() {
    timer.start();
    notifyListeners();
  }

  void setExerciseState({isPaused = false}) {
    isExercisePaused = isPaused;
    notifyListeners();
  }

  void pauseTimer() {
    timer.pause();
    currentIndex = null;
    notifyListeners();
  }

  void calculateAverageReactionTime() {
    double average = (totalDelayTime/kPredifinedRunTimeSeconds );
   
      averageReactionTime = average.toPrecision(2);
    
    notifyListeners();
  }

  void resetTimer() {
    timer.reset();

    notifyListeners();
  }

  void setCurrentIndex(int val) {
    currentIndex = val;
    notifyListeners();
  }
}
