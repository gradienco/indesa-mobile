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