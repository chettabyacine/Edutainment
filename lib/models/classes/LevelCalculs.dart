import 'package:flutter/material.dart';

import 'AnswerCalculs.dart';
import 'Level.dart';
import 'QuestionCalculs.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:edutainment/models/DB/QuestionCalculesDBModel.dart';
import 'package:edutainment/models/DB/QuestionDB.dart';

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
      int currentQuestion,
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
          currentQuestion: currentQuestion,
        ) {
    this._waitingQuestions = waitingQuestions;
    this._timeLeft = timeLeft;
    this._duration = duration;
  }

  List<Widget> getStars() {
    List<Widget> list = [];
    for (int i = 1; i <= 3; i++) {
      i <= getNumbreOfStars()
          ? list.add(SvgPicture.asset('assets/star full.svg'))
          : list.add(SvgPicture.asset('assets/star empty.svg'));
    }
    return list;
  }

  void nextQuestion() {
    if (getCurrentQuestionIndex() >= _waitingQuestions.length) return;
    setCurrentQuestionIndex(getCurrentQuestionIndex() + 1);
  }

  QuestionCalculs currentQuestion() {
    print(getCurrentQuestionIndex());
    return _waitingQuestions.elementAt(getCurrentQuestionIndex());
  }

  void onAnsweredCorrectly() {
    _correctlyAnswered.add(currentQuestion());
    nextQuestion();
    incrementCurrentScore();
  }

  void onAnsweredIncorrectly() {
    _incorrectlyAnswered.add(currentQuestion());
    nextQuestion();
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
    _correctlyAnswered.add(questionCalculs);
  }

  void addIncorrectAnswer(QuestionCalculs questionCalculs) {
    print('${questionCalculs.getNumberA()}');
    _incorrectlyAnswered.add(questionCalculs);
  }
  Future fillQuestionBank(int level) async {
    final List<QuestionCalculesDBModel> list = await QuestionDB.instance.readLevelCalcules(level);
    for (QuestionCalculesDBModel questionCalcules in list){
     if(questionCalcules.level==level) _waitingQuestions.add(questionCalcules.convertToRealQuestion());
    }
  }
}
