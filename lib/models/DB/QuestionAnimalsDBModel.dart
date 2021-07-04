final String tableQuestionsAnimals = 'tableQuestionsAnimals';
class QuestionAnimalsBDFields {
  static final List<String> values =[id,level,type,usesInput,questionText,answers,correctIndex,imagePath,audioPath];
  static final String id = "_id";
  static final String level = "level";
  static final String type = "type";
  static final String usesInput = "usesInput";
  static final String questionText = "questionText";
  static final String answers = "answers";
  static final String correctIndex = "correctIndex";
  static final String imagePath = "imagePath";
  static final String audioPath = "audioPath";
}
class QuestionAnimalsDBModel {
  int id;
  int level;
  int type;
  bool usesInput;
  String questionText;
  String answers;
  int correctIndex;
  String imagePath;
  String audioPath;

  QuestionAnimalsDBModel(
      {this.id,
      this.level,
      this.type,
      this.usesInput,
      this.questionText,
      this.answers,
      this.correctIndex,
      this.imagePath,
      this.audioPath});
  Map<String, dynamic> toMap() {
    return {
      '_id': id,
      'level': level,
      'type': type,
      'usesInput': usesInput,
      'questionText': questionText,
      'answers': answers,
      'correctIndex': correctIndex,
      'imagePath': imagePath,
      'audioPath': audioPath,
    };
  }

  static QuestionAnimalsDBModel fromMap(Map<String, dynamic> map) =>
       QuestionAnimalsDBModel(
        id: map['_id'],
        level: map['level'],
        type: map['type'],
        usesInput: map['usesInput'] == 1,
        questionText: map['questionText'],
        answers: map['answers'],
        correctIndex: map['correctIndex'],
        imagePath: map['imagePath'],
        audioPath: map['audioPath'],
      );
  QuestionAnimalsDBModel copy({
    int id,
    int level,
    int type,
    bool usesInput,
    String questionText,
    String answers,
    int correctIndex,
    String imagePath,
    String audioPath,
  }) => QuestionAnimalsDBModel(
    id: id ?? this.id,
    level: level ?? this.level,
    type: type ?? this.level,
    usesInput: usesInput ?? this.usesInput,
    questionText: questionText ?? this.questionText,
    answers: answers ?? this.answers,
    correctIndex: correctIndex ?? this.correctIndex,
    imagePath: imagePath ?? this.imagePath,
    audioPath: audioPath ?? this.audioPath,
  );
}
