import 'package:flutter_test/flutter_test.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:indesa_beta/models/models.dart';
import 'package:indesa_beta/utils/utils.dart';
import 'package:mockito/mockito.dart';

class MockDatabaseHelper extends Mock implements DatabaseHelper {}

void main(){
  final dbHelper = MockDatabaseHelper();

  test('database dapat di inisialisasi', (){
    dbHelper.initializeDatabase();
    verify(dbHelper.initializeDatabase());

    dbHelper.initializeDatabase();
    dbHelper.initializeDatabase();
    dbHelper.initializeDatabase();
    verify(dbHelper.initializeDatabase()).called(3);
  });

  test("memasukan data pengguna ke database", () async {
    final user = User(
        1,
        'user@email.com',
        'username',
        'fullname',
        '123',
        '456',
        '08123456789',
        1001,
        'admin',
        'token',
        123123
    );

    when(dbHelper.insertUserData(user)).thenAnswer((_)=>Future.value(1));
    expect(await dbHelper.insertUserData(user), 1);
  });

  test("mengambil data pengguna dari database", () async {
    Map<String, dynamic> mapUser(){
      var map = Map<String, dynamic>();
      map['user_id'] = 1;
      map['email'] = 'johndoe@mail.com';
      map['username'] = 'johndoe';
      map['nama_lengkap'] = 'John Doe';
      map['nik'] = '123';
      map['nip'] = '456';
      map['no_hp'] = '08123456789';
      map['role'] = 1001;
      map['nama_role'] = 'admin';
      map['token'] = 'token123';
      map['expired'] = 123123;
      return map;
    }

    when(dbHelper.getUser()).thenAnswer((_)=>Future.value(
      mapUser()
    ));
    var data = await dbHelper.getUser();
    expect(data, mapUser());
    expect(data['nama_lengkap'], 'John Doe');
  });

  test("mengembalikan true jika terdapat token dan false jika tidak ada token", () async {
    when(dbHelper.checkToken()).thenAnswer((_)=>Future.value("Bearer token"));
    bool tokenIsNotEmpty(String token){
      if (token.isNotEmpty){
        return true;
      } else {
        return false;
      }
    }
    expect(tokenIsNotEmpty(await dbHelper.checkToken()), true);

    when(dbHelper.checkToken()).thenAnswer((_)=>Future.value(""));
    expect(tokenIsNotEmpty(await dbHelper.checkToken()), false);
  });

  test("menghapus data pengguna yang ada di database", () async {
    when(dbHelper.deleteUserData()).thenAnswer((_)=>Future.value(1));
    expect(await dbHelper.deleteUserData(), 1);
  });

  test("memasukan data survei ke database", () async {
    Survey survey = Survey(
      1,
      181004121,
      12,
      0.5,
      0.6,
      0.7,
      0.8,
      [
        Answer(1,3,5),
        Answer(2,2,3),
        Answer(3,5,2)
      ]
    );
    when(dbHelper.insertSurveyData(survey)).thenAnswer((_)=>Future.value(1));
    expect(await dbHelper.insertSurveyData(survey), 1);
  });

  test("mengambil riwayat data survei dari database", () async {
    Map<String, dynamic> mapSurvey(){
      var map = Map<String, dynamic>();
      map['survey_id'] = 12;
      map['user_id'] = 1;
      map['desa_id'] = 181004121;
      map['iks'] = 0.5;
      map['ike'] = 0.6;
      map['ikl'] = 0.7;
      map['idm'] = 0.8;
      map['answer'] = '''
     {
        [
          question_number : 1,
          value : 3
        ],
        [
          question_number : 2,
          value : 5
        ],
        ...
     }
      ''';
      return map;
    }
    when(dbHelper.getUser()).thenAnswer((_)=>Future.value(
        mapSurvey()
    ));
    var data = await dbHelper.getUser();
    expect(data, mapSurvey());
    expect(data['idm'], 0.8);
  });

}