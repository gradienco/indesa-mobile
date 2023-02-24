import 'dart:convert';
import 'package:indesa_beta/models/models.dart';

class Survey {
  int _userId, _desaId, _surveyId;
  double _iks, _ike, _ikl, _idm;
  List<Answer> _answers;

  Survey(this._userId, this._desaId, this._surveyId, this._iks, this._ike,
      this._ikl, this._idm, this._answers);

  int get userId => _userId;
  int get desaId => _desaId;
  int get surveyId => _surveyId;
  double get iks => _iks;
  double get ike => _ike;
  double get ikl => _ikl;
  double get idm => _idm;
  List<Answer> get answers => _answers;

  Map toJson() {
    List<Map> answer = this.answers.map((i) => i.toJson()).toList();
    return {
      'answer': answer,
    };
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map['survey_id'] = _surveyId;
    map['user_id'] = _userId;
    map['desa_id'] = _desaId;
    map['iks'] = _iks;
    map['ike'] = _ike;
    map['ikl'] = _ikl;
    map['idm'] = _idm;
    map['answer'] = jsonEncode(this.toJson());
    return map;
  }
}
