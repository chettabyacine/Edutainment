import 'package:flutter/material.dart';

import 'Level.dart';
import 'QuestionCalculs.dart';

class LevelCalculs extends Level {
  List<QuestionCalculs> _waitingQuestions;
  List<QuestionCalculs> _correctlyAnswered;
  List<QuestionCalculs> _incorrectlyAnswered;
  int _duration;
  int _timeLeft;

  LevelCalculs(
      {int id,
      int userId,
      int domainIndex,
      int highestScore,
      int currentScore,
      int numberOfStars,
      int indexOfDataBase,
      List<QuestionCalculs> waitingQuestions,
      int duration,
      Color color,
      int timeLeft})
      : super(
          id: id,
          userId: userId,
          domainIndex: domainIndex,
          highestScore: highestScore,
          currentScore: currentScore,
          numberOfStars: numberOfStars,
          indexOfDataBase: indexOfDataBase,
          color: color,
        ) {
    this._waitingQuestions = waitingQuestions;
    this._timeLeft = timeLeft;
    this._duration = duration;
  }

  List<QuestionCalculs> getWaitingQuestions() {
    return this._waitingQuestions;
  }

  void setWaitingQuestions(List<QuestionCalculs> waitingQuestions) {
    this._waitingQuestions = waitingQuestions;
  }

  List<QuestionCalculs> getCorrectlyAnswered() {
    return this._correctlyAnswered;
  }

  void setCorrectlyAnswered(List<QuestionCalculs> correctlyAnswered) {
    this._correctlyAnswered = correctlyAnswered;
  }

  List<QuestionCalculs> getIncorrectlyAnswered() {
    return this._incorrectlyAnswered;
  }

  void setIncorrectlyAnswered(List<QuestionCalculs> incorrectlyAnswered) {
    this._incorrectlyAnswered = incorrectlyAnswered;
  }

  int getDuration() {
    return this._duration;
  }

  void setDuration(int duration) {
    this._duration = duration;
  }

  void setTimeLeft(int time) {
    this._timeLeft = time;
  }

  int getTimeLeft() {
    return this._timeLeft;
  }

  void addCorrectAnswer(QuestionCalculs questionCalculs) {
    this._correctlyAnswered.add(questionCalculs);
  }

  void addIncorrectAnswer(QuestionCalculs questionCalculs) {
    _incorrectlyAnswered.add(questionCalculs);
  }
}
