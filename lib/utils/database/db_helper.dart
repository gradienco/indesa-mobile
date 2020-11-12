import 'dart:io';
import 'package:indesa_beta/models/models.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper{
  static DatabaseHelper _databaseHelper;
  static Database _database;

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
    String path = directory.path + 'notes.db';

    var notesDatabase = await openDatabase(path, version: 1, onCreate: _createUserDb);
    return notesDatabase;
  }

  void _createUserDb(Database db, int newVersion) async{
    await db.execute('''
      CREATE TABLE $userTable(
        $colUserId INTEGER PRIMARY KEY AUTOINCREMENT, 
        $colEmail TEXT, 
        $colUsername TEXT, 
        $colNamaLengkap TEXT, 
        $colNik TEXT,
        $colNip TEXT,
        $colNoHp TEXT, 
        $colRole INT, 
        $colNamaRole TEXT,
        $colToken TEXT,
        $colExpired INT)
    ''');
  }

  //fetch
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

  //insert
  Future<int> insertUserData(User user) async {
    Database db = await this.database;
    var result = await db.insert(userTable, user.toMap());
    return result;
  }

  //delete
  Future<int> deleteUserData() async {
    Database db = await this.database;
   // var result = await db.rawDelete('DELETE FROM $noteTable WHERE $colId = $id');
    var result = await db.delete(userTable);
    return result;
  }

  //get the 'map list' [List<map>] and convert it to 'user data' [List<Note>]
  // Future<Map<String, dynamic>> getUserData() async{
  //
  //   var noteMapList = await getNoteMapList();
  //   int count = noteMapList.length;
  //
  //   List<Note> noteList = List<Note>();
  //
  //   for(int i=0; i<count; i++){
  //     noteList.add(Note.fromMapObject(noteMapList[i]));
  //   }
  //
  //   return noteList;
  // }
}