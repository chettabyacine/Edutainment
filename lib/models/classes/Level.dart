import 'package:edutainment/models/classes/QuestionCalculs.dart';
import 'package:flutter/material.dart';

class Level {
  int _id;
  int _userId;
  int _domainIndex;
  int _highestScore;
  int _currentScore;
  int _numberOfStars;
  int _indexOfDataBase;
  int _currentQuestionIndex;
  Color _color;
  static int _averageScore;

  Level(
      {int id,
      int userId,
      int domainIndex,
      int highestScore,
      int currentScore,
      int numberOfStars,
      int indexOfDataBase,
      Color color,
      int currentQuestion}) {
    this._id = id;
    this._userId = userId;
    this._domainIndex = domainIndex;
    this._highestScore = highestScore;
    this._currentScore = currentScore;
    this._numberOfStars = numberOfStars;
    this._indexOfDataBase = indexOfDataBase;
    this._color = color;
    this._currentQuestionIndex = currentQuestion;
  }

  int getCurrentQuestionIndex() {
    return this._currentQuestionIndex;
  }

  int setCurrentQuestionIndex(int value) {
    this._currentQuestionIndex = value;
  }

  int getId() {
    return this._id;
  }

  void setId(int id) {
    this._id = id;
  }

  int getUserId() {
    return this._userId;
  }

  void setUser(int userId) {
    this._userId = userId;
  }

  int getHighestScore() {
    return this._highestScore;
  }

  void setHighestScore(int highestScore) {
    this._highestScore = highestScore;
  }

  int getCurrentScore() {
    return this._currentScore;
  }

  void setCurrentScore(int currentScore) {
    this._currentScore = currentScore;
  }

  int getNumbreOfStars() {
    return this._numberOfStars;
  }

  void setNumbreOfStars(int numberOfStars) {
    this._numberOfStars = numberOfStars;
  }

  int getIndexOfDataBase() {
    return this._indexOfDataBase;
  }

  void setIndexOfDataBase(int indexOfDataBase) {
    this._indexOfDataBase = indexOfDataBase;
  }

  static int getAverageScore() {
    return _averageScore;
  }

  static void setAverageScore(int averageScore) {
    Level._averageScore = averageScore;
  }

  void setColor(Color color) {
    this._color = color;
  }

  Color getColor() {
    return this._color;
  }

  void incrementCurrentScore() {
    this._currentScore++;
    computeStars();
  }

  void computeStars() {
    if (2 * _currentScore < _averageScore) {
      setNumbreOfStars(0);
      return;
    }
    if (10 * _currentScore < 8 * _averageScore) {
      setNumbreOfStars(1);
      return;
    }
    if (_currentScore < _averageScore) {
      setNumbreOfStars(2);
      return;
    }
    setNumbreOfStars(3);
  }
}
