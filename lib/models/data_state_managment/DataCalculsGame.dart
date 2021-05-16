import 'package:edutainment/models/classes/AnswerCalculs.dart';
import 'package:edutainment/models/classes/LevelCalculs.dart';
import 'package:edutainment/models/classes/QuestionCalculs.dart';
import 'package:flutter/cupertino.dart';

class DataCalculsGame with ChangeNotifier {
  LevelCalculs levelCalculs;
  DataCalculsGame({@required this.levelCalculs});

  void incrementScore() {
    levelCalculs.incrementCurrentScore();
    notifyListeners();
  }

  void deincrementScore() {
    levelCalculs.setCurrentScore(levelCalculs.getCurrentScore() + 1);
    notifyListeners();
  }

  int getNumberOfStars() {
    return levelCalculs.getNumbreOfStars();
  }

  int getCurrentScore() {
    return levelCalculs.getCurrentScore();
  }

  QuestionCalculs currentQuestion() {
    print("TEST : ${levelCalculs.getWaitingQuestions().first.getNumberB()}");
    return levelCalculs.getWaitingQuestions().first;
  }

  AnswerCalculs correctAnswer() {
    return currentQuestion().getCorrectAnswer();
  }

  void correctlyAnswered() {
    levelCalculs.addCorrectAnswer(currentQuestion());
    incrementScore();
    try {
      levelCalculs.getWaitingQuestions().removeAt(0);
    } catch (Exception) {}
  }

  void incorrectlyAnswered() {
    levelCalculs.addIncorrectAnswer(currentQuestion());
    deincrementScore();
    try {
      levelCalculs.getWaitingQuestions().removeAt(0);
    } catch (Exception) {}
  }
}
