class User{
  int _userId;
  String _email;
  String _username;
  String _namaLengkap;
  String _nik;
  String _nip;
  String _noHp;
  int _role;
  String _namaRole;
  String _token;
  int _expired;

  User(this._userId, this._email, this._username, this._namaLengkap, this._nik, this._nip, this._noHp, this._role, this._namaRole, this._token, this._expired);
 // User.withId(this._userId, this._email, this._username, this._namaLengkap, this._nik, this._nip, this._noHp, this._role, this._namaRole, this._token, this._expired);

  int get userId => _userId;
  String get email => _email;
  String get username => _username;
  String get namaLengkap => _namaLengkap;
  String get nik => _nik;
  String get nip => _nip;
  String get noHp => _noHp;
  int get role => _role;
  int get expired => _expired;
  String get namaRole => _namaRole;
  String get token => _token;

  //convert into map object
  Map<String, dynamic> toMap(){
    var map = Map<String, dynamic>();
    if(userId != null){
      map['user_id'] = _userId;
    }
    map['email'] = _email;
    map['username'] = _username;
    map['nama_lengkap'] = _namaLengkap;
    map['nik'] = _nik;
    map['nip'] = _nip;
    map['no_hp'] = _noHp;
    map['role'] = _role;
    map['expired'] = _expired;
    map['nama_role'] = _namaRole;
    map['token'] = _token;

    return map;
  }

  //ekstrak a map object to note object
  // User.fromMapObject(Map<String, dynamic> map){
  //   this._userId = map['userId'];
  //   this._email = map['email'];
  //   this._username = map['username'];
  //   this._namaLengkap = map['namaLengkap'];
  //   this._nik = map['nik'];
  //   this._nip = map['nip'];
  //   this._noHp = map['noHp'];
  //   this._role = map['role'];
  //   this._expired = map['expired'];
  //   this._namaRole = map['namaRole'];
  //   this._token = map['token'];
// flutter packages pub run build_runner build
  // }
}