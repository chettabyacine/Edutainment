import 'Level.dart';
import 'QuestionGeometry.dart';
class LevelGeometry extends Level {
  List<QuestionGeometry> _waitingQuestions;
  List<QuestionGeometry> _correctlyAnswered;
  List<QuestionGeometry> _incorrectlyAnswered;

  LevelGeometry(
      int id,
      int userId,
      int domainIndex,
      int highestScore,
      int currentScore,
      int numbreOfStars,
      int indexOfDataBase,
      List<QuestionGeometry> waitingQuestions)
      : super(id:id, userId:userId, domainIndex:domainIndex, highestScore:highestScore, currentScore:currentScore,
      numbreOfStars:numbreOfStars, indexOfDataBase:indexOfDataBase) {
    this._waitingQuestions = waitingQuestions;
  }

  List<QuestionGeometry> getWaitingQuestions() {
    return this._waitingQuestions;
  }

  void setWaitingQuestions(List<QuestionGeometry> waitingQuestions) {
    this._waitingQuestions = waitingQuestions;
  }

  List<QuestionGeometry> getCorrectlyAnswered() {
    return this._correctlyAnswered;
  }

  void setCorrectlyAnswered(List<QuestionGeometry> correctlyAnswered) {
    this._correctlyAnswered = correctlyAnswered;
  }

  List<QuestionGeometry> getIncorrectlyAnswered() {
    return this._incorrectlyAnswered;
  }

  void setIncorrectlyAnswered(List<QuestionGeometry> incorrectlyAnswered) {
    this._incorrectlyAnswered = incorrectlyAnswered;
  }
}
