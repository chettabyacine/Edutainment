class Question {
  String _content;
  int _complexity; //the level in with the question will be shown

  Question({String content, int complexity}) {
    this._content = content;
    this._complexity = complexity;
  }

  String getContent() {
    return this._content;
  }

  void setContent(String content) {
    this._content = content;
  }

  int getComplexity() {
    return this._complexity;
  }

  void setComplexity(int complexity) {
    this._complexity = complexity;
  }
}


