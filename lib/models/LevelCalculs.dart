import 'Level.dart';
import 'QuestionCalculs.dart';
class LevelCalculs extends Level {
  List<QuestionCalculs> _waitingQuestions;
  List<QuestionCalculs> _correctlyAnswered;
  List<QuestionCalculs> _incorrectlyAnswered;
  static int _Duration;
  int _timeLeft;

  LevelCalculs(
      int id,
      int userId,
      int domainIndex,
      int highestScore,
      int currentScore,
      int numberOfStars,
      int indexOfDataBase,
      List<QuestionCalculs> waitingQuestions,
      int timeLeft)
      : super(id:id, userId:userId, domainIndex:domainIndex, highestScore:highestScore, currentScore:currentScore,
      numberOfStars:numberOfStars, indexOfDataBase:indexOfDataBase) {
    this._waitingQuestions = waitingQuestions;
    this._timeLeft = timeLeft;
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

  static int getDuration() {
    return LevelCalculs._Duration;
  }

  static void setDuration(int duration) {
    LevelCalculs._Duration = duration;
  }
}
