import 'package:edutainment/models/Statistics.dart';
class Level {
  int _id;
  int _userId;
  int _domainIndex;
  int _highestScore;
  int _currentScore;
  int _numberOfStars;
  int _indexOfDataBase;
  static int _averageScore;

  Level({int id, int userId, int domainIndex, int highestScore, int currentScore,
      int numberOfStars, int indexOfDataBase}) {
    this._id = id;
    this._userId = userId;
    this._domainIndex = domainIndex;
    this._highestScore = highestScore;
    this._currentScore = currentScore;
    this._numberOfStars = numberOfStars;
    this._indexOfDataBase = indexOfDataBase;
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

  int getNumberOfStars() {
    return this._numberOfStars;
  }

  void setNumberOfStars(int numberOfStars) {
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

  void incrementCurrentScore() {
    this._currentScore++;
  }

  void computeStars() {
    if (_currentScore < 0.5 * _averageScore) return;
    if (_currentScore < 0.8 * _averageScore) {
      setNumberOfStars(1);
      return;
    }
    if (_currentScore < _averageScore) {
      setNumberOfStars(2);
      return;
    }
    setNumberOfStars(3);
  }

  //TODO : implement this function
   void updateStatistics(Statistics statistics) {
    DateTime date;
    int oldScore = 0;
  }

}
