import 'Level.dart';
import 'QuestionAnimals.dart';
class LevelAnimals extends Level {
  List<QuestionAnimals> _waitingQuestions;
  List<QuestionAnimals> _correctlyAnswered;
  List<QuestionAnimals> _incorrectlyAnswered;

  LevelAnimals(int id,
      int userId,
      int domainIndex,
      int highestScore,
      int currentScore,
      int numbreOfStars,
      int indexOfDataBase,
      List<QuestionAnimals> waitingQuestions)
      : super(
      id:id,
      userId:userId,
      domainIndex:domainIndex,
      highestScore:highestScore,
      currentScore:currentScore,
      numbreOfStars:numbreOfStars,
      indexOfDataBase : indexOfDataBase) {
    this._waitingQuestions = waitingQuestions;
  }


  List<QuestionAnimals> getWaitingQuestions() {
    return this._waitingQuestions;
  }

  void setWaitingQuestions(List<QuestionAnimals> waitingQuestions) {
    this._waitingQuestions = waitingQuestions;
  }

  List<QuestionAnimals> getCorrectlyAnswered() {
    return this._correctlyAnswered;
  }

  void setCorrectlyAnswered(List<QuestionAnimals> correctlyAnswered) {
    this._correctlyAnswered = correctlyAnswered;
  }

  List<QuestionAnimals> getIncorrectlyAnswered() {
    return this._incorrectlyAnswered;
  }

  void setIncorrectlyAnswered(List<QuestionAnimals> incorrectlyAnswered) {
    this._incorrectlyAnswered = incorrectlyAnswered;
  }
}
