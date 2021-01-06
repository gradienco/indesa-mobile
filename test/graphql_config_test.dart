import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:indesa_beta/utils/utils.dart';
import 'package:mockito/mockito.dart';

class MockGraphQlConfig extends Mock implements GraphQlConfig {}

void main(){

  GraphQlConfig gqlConfig;
  GraphQLClient gqlClient;
  setUp(){
    gqlConfig = GraphQlConfig();
    gqlClient = GraphQLClient(
      link: HttpLink(uri: 'dummyLink.com'),
      cache: InMemoryCache()
    );
  }

  test("Tes config graphQL dengan token", (){
    String token = "dummyToken";
    Object o;
    // when(gqlConfig.clientToQuery().mutate(MutationOptions(documentNode: gql('blbl')))).thenAnswer((_)=> Future.value(o));
    gqlConfig.clientToQuery().mutate(MutationOptions(documentNode: gql('blbl')));
    verify(gqlConfig.clientToQuery().mutate(MutationOptions(documentNode: gql('blbl'))));
    // expect(gqlConfig.clientToQuery().mutate(MutationOptions(documentNode: gql('blbl'))), o);
  });


}