class Answer {

  int _questionNumber, _value;

  Answer(this._questionNumber, this._value);

  Answer.map(dynamic obj){
    this._questionNumber = obj['question_number'];
    this._value = obj['value'];
  }

  int get questionNumber => _questionNumber;
  int get value => _value;

  set questionNumber(int number){
    _questionNumber = number;
  }
  set value(int number){
    _value = number;
  }

  Map<String, dynamic> toMap(){
    var map = Map<String, dynamic>();

    map['question_number'] = _questionNumber;
    map['value'] = _value;

    return map;
  }

  Answer.fromMapObject(Map<String, dynamic> map){
    this._questionNumber = map['question_number'];
    this._value = map['value'];
  }

  void setQuestionNumber(int questionNumber){
    this._questionNumber = questionNumber;
  }

}