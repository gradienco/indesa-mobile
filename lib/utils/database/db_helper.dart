import 'dart:io';
import 'package:indesa_beta/models/models.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper{
  static DatabaseHelper _databaseHelper;
  static Database _database;

  //user
  String userTable = "user_table";
  String colUserId = "user_id";
  String colEmail = "email";
  String colUsername = "username";
  String colNamaLengkap = "nama_lengkap";
  String colNik = "nik";
  String colNip = "nip";
  String colNoHp = "no_hp";
  String colRole = "role";
  String colNamaRole = "nama_role";
  String colToken = "token";
  String colExpired = "expired";

  //survey
  String surveyTable = "survey_table";
  String colSurveyId = "survey_id";
  String colUser = "user_id";
  String colDesa = "desa_id";
  String colIKS = "iks";
  String colIKE = "ike";
  String colIKL = "ikl";
  String colIDM = "idm";
  String colAnswer = "answer";

  DatabaseHelper._createInstance();

  factory DatabaseHelper(){

    if(_databaseHelper == null){
      _databaseHelper = DatabaseHelper._createInstance();
    }

    return _databaseHelper;
  }

  Future<Database> get database async{
    if (_database == null){
      _database = await initializeDatabase();
    }

    return _database;
  }

  Future<Database> initializeDatabase() async{
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'indesa.db';

    var initDB = await openDatabase(path, version: 1, onCreate: _createDb);
    return initDB;
  }

  void _createDb(Database db, int newVersion) async{
    await db.execute('''
      CREATE TABLE $surveyTable(
        $colSurveyId INTEGER PRIMARY KEY, 
        $colUser INT, 
        $colDesa INT, 
        $colIKS DECIMAL (17,16), 
        $colIKE DECIMAL (17,16),
        $colIKL DECIMAL (17,16),
        $colIDM DECIMAL (17,16), 
        $colAnswer TEXT)
    ''');

    await db.execute('''
      CREATE TABLE $userTable(
        $colUserId INTEGER PRIMARY KEY, 
        $colEmail TEXT, 
        $colUsername TEXT, 
        $colNamaLengkap TEXT, 
        $colNik TEXT,
        $colNip TEXT,
        $colNoHp TEXT, 
        $colRole INT, 
        $colNamaRole TEXT,
        $colToken TEXT,
        $colExpired INT);
    ''');
  }

  //insert data user
  Future<int> insertUserData(User user) async {
    Database db = await this.database;
    var result = await db.insert(userTable, user.toMap());
    return result;
  }

  //fetch data user
  Future<Map<String, dynamic>>getUser() async {
    Database db = await this.database;
    //  var result = await db.rawQuery('SELECT * FROM $noteTable order by $colPriority ASC');
    var result = await db.query(userTable);
    var userData = result[0];
    return userData;
  }

  Future<String>checkToken() async {
    Database db = await this.database;
    //  var result = await db.rawQuery('SELECT * FROM $noteTable order by $colPriority ASC');
    var result = await db.query(userTable);
    var token = result[0]['token'];
    return token;
  }

  //delete data user
  Future<int> deleteUserData() async {
    Database db = await this.database;
   // var result = await db.rawDelete('DELETE FROM $noteTable WHERE $colId = $id');
    var result = await db.delete(userTable);
    return result;
  }

  //insert data survey
  Future<int> insertSurveyData(Survey survey) async {
    Database db = await this.database;
    var result = await db.insert(surveyTable, survey.toMap());
    return result;
  }

  //fetch data survey
  Future<Map<String, dynamic>>getSurveyData(int surveyId) async {
    Database db = await this.database;
    //  var result = await db.rawQuery('SELECT * FROM $noteTable order by $colPriority ASC');
    var result = await db.query(surveyTable, where: "$colSurveyId = $surveyId");
    var surveyData = result[0];
    return surveyData;
  }

}