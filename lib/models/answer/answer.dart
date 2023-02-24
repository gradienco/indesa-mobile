class Answer {

  int _questionNumber, _value, _id;

  Answer(this._questionNumber, this._value, this._id);

  Map toJson() => {
    'question_number': questionNumber,
    'value': value,
    'id' : id
  };

  factory Answer.fromJson(dynamic json) {
    return Answer(json['question_number'] as int, json['value'] as int, json['id'] as int);
  }

  @override
  String toString() {
    return '{ ${this._questionNumber}, ${this._value} }';
  }

  Answer.map(dynamic obj){
    this._questionNumber = obj['question_number'];
    this._value = obj['value'];
    this._id = obj['id'];
  }

  int get questionNumber => _questionNumber;
  int get value => _value;
  int get id => _id;

  set questionNumber(int number){
    _questionNumber = number;
  }
  set value(int number){
    _value = number;
  }
  set id(int id){
    _id = id;
  }

  Map<String, dynamic> toMap(){
    var map = Map<String, dynamic>();

    map['question_number'] = _questionNumber;
    map['value'] = _value;
    map['id'] = _id;

    return map;
  }

  Answer.fromMapObject(Map<String, dynamic> map){
    this._questionNumber = map['question_number'];
    this._value = map['value'];
    this._id = map['id'];
  }

  void setQuestionNumber(int questionNumber){
    this._questionNumber = questionNumber;
  }

}