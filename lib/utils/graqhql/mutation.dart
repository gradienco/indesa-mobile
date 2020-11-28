import 'package:graphql_flutter/graphql_flutter.dart';

MutationOptions loginOptions(String email, String password){
  var mutation = """
  mutation {
  login(email: "$email" password: "$password"){
    userId
    email
    username
    namaLengkap
    nik
    nip
    noHp
    role
    namaRole
    token
    expired
  }
}
""";
  return MutationOptions(
    documentNode: gql(mutation)
  );
}

MutationOptions addSurveyOptions(int userId, int desaId, int tipe, double iSos, double iEk, double iL, double idm){
  var mutation = """
  mutation {
  addSurvey(
    userId: $userId
    desaId: $desaId
    tipe: $tipe
    poinIs: $iSos
    poinIl: $iL
    poinIdm: $idm
    poinIek: $iEk
  ){
    id
  }
}
""";
  return MutationOptions(
      documentNode: gql(mutation)
  );
}