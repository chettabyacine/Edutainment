import 'Level.dart';
import 'QuestionAnimals.dart';
import 'QuestionCalculs.dart';
import 'QuestionGeometry.dart';
import 'NumberQuestions.dart';
 class LevelEvaluation extends Level {
    List<QuestionAnimals> waitingQuestionsAnimals;
    List<QuestionAnimals> correctlyAnsweredAnimals;
    List<QuestionAnimals> incorrectlyAnsweredAnimals;

    List<QuestionGeometry> waitingQuestionsGeometry;
    List<QuestionGeometry> correctlyAnsweredGeometry;
    List<QuestionGeometry> incorrectlyAnsweredGeometry;

    List<QuestionCalculs> waitingQuestionsCalculs;
    List<QuestionCalculs> correctlyAnsweredCalculs;
    List<QuestionCalculs> incorrectlyAnsweredCalculs;

    NumberQuestions questionsNumber;
     LevelEvaluation(int id, int userId, int highestScore, int currentScore, int numbreOfStars, int indexOfDataBase,
        List<QuestionAnimals> waitingQuestionsAnimals, List<QuestionAnimals> correctlyAnsweredAnimals,
        List<QuestionAnimals> incorrectlyAnsweredAnimals, List<QuestionGeometry> waitingQuestionsGeometry,
        List<QuestionGeometry> correctlyAnsweredGeometry, List<QuestionGeometry> incorrectlyAnsweredGeometry,
        List<QuestionCalculs> waitingQuestionsCalculs, List<QuestionCalculs> correctlyAnsweredCalculs,
        List<QuestionCalculs> incorrectlyAnsweredCalculs, NumberQuestions questionsNumber) :
      super(id:id, userId:userId, highestScore:highestScore, currentScore:currentScore, numbreOfStars:numbreOfStars, indexOfDataBase:indexOfDataBase){
      this.waitingQuestionsAnimals = waitingQuestionsAnimals;
      this.correctlyAnsweredAnimals = correctlyAnsweredAnimals;
      this.incorrectlyAnsweredAnimals = incorrectlyAnsweredAnimals;
      this.waitingQuestionsGeometry = waitingQuestionsGeometry;
      this.correctlyAnsweredGeometry = correctlyAnsweredGeometry;
      this.incorrectlyAnsweredGeometry = incorrectlyAnsweredGeometry;
      this.waitingQuestionsCalculs = waitingQuestionsCalculs;
      this.correctlyAnsweredCalculs = correctlyAnsweredCalculs;
      this.incorrectlyAnsweredCalculs = incorrectlyAnsweredCalculs;
      this.questionsNumber = questionsNumber;
    }

   List<QuestionAnimals> getWaitingQuestionsAnimals() {
    return this.waitingQuestionsAnimals;
    }

     void setWaitingQuestionsAnimals(List<QuestionAnimals> waitingQuestionsAnimals) {
    this.waitingQuestionsAnimals = waitingQuestionsAnimals;
    }

    List<QuestionAnimals> getCorrectlyAnsweredAnimals() {
    return this.correctlyAnsweredAnimals;
    }

    void setCorrectlyAnsweredAnimals(List<QuestionAnimals> correctlyAnsweredAnimals) {
    this.correctlyAnsweredAnimals = correctlyAnsweredAnimals;
    }

     List<QuestionAnimals> getIncorrectlyAnsweredAnimals() {
    return this.incorrectlyAnsweredAnimals;
    }

     void setIncorrectlyAnsweredAnimals(List<QuestionAnimals> incorrectlyAnsweredAnimals) {
    this.incorrectlyAnsweredAnimals = incorrectlyAnsweredAnimals;
    }

     List<QuestionGeometry> getWaitingQuestionsGeometry() {
    return this.waitingQuestionsGeometry;
    }

     void setWaitingQuestionsGeometry(List<QuestionGeometry> waitingQuestionsGeometry) {
    this.waitingQuestionsGeometry = waitingQuestionsGeometry;
    }

     List<QuestionGeometry> getCorrectlyAnsweredGeometry() {
    return this.correctlyAnsweredGeometry;
    }

     void setCorrectlyAnsweredGeometry(List<QuestionGeometry> correctlyAnsweredGeometry) {
    this.correctlyAnsweredGeometry = correctlyAnsweredGeometry;
    }

     List<QuestionGeometry> getIncorrectlyAnsweredGeometry() {
    return this.incorrectlyAnsweredGeometry;
    }

     void setIncorrectlyAnsweredGeometry(List<QuestionGeometry> incorrectlyAnsweredGeometry) {
    this.incorrectlyAnsweredGeometry = incorrectlyAnsweredGeometry;
    }

     List<QuestionCalculs> getWaitingQuestionsCalculs() {
    return this.waitingQuestionsCalculs;
    }

     void setWaitingQuestionsCalculs(List<QuestionCalculs> waitingQuestionsCalculs) {
    this.waitingQuestionsCalculs = waitingQuestionsCalculs;
    }

     List<QuestionCalculs> getCorrectlyAnsweredCalculs() {
    return this.correctlyAnsweredCalculs;
    }

     void setCorrectlyAnsweredCalculs(List<QuestionCalculs> correctlyAnsweredCalculs) {
    this.correctlyAnsweredCalculs = correctlyAnsweredCalculs;
    }

     List<QuestionCalculs> getIncorrectlyAnsweredCalculs() {
    return this.incorrectlyAnsweredCalculs;
    }

     void setIncorrectlyAnsweredCalculs(List<QuestionCalculs> incorrectlyAnsweredCalculs) {
    this.incorrectlyAnsweredCalculs = incorrectlyAnsweredCalculs;
    }

     NumberQuestions getQuestionsNumber() {
    return this.questionsNumber;
    }

     void setQuestionsNumber(NumberQuestions questionsNumber) {
    this.questionsNumber = questionsNumber;
    }}