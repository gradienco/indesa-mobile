import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class GraphQlConfig {
  static HttpLink httpLink = HttpLink(
    uri: 'https://api.indesa.id/graphql',
  );

  static String _token;

 static final AuthLink authLink = AuthLink(
     getToken: () => 'Bearer $_token');

  static Link link = httpLink;

  static Link linkAuth = authLink.concat(httpLink);

  static ValueNotifier<GraphQLClient> initializeClient () {
    ValueNotifier<GraphQLClient> client =
    ValueNotifier(
        GraphQLClient(
            cache: InMemoryCache(), //OptimisticCache(dataIdFromObject: typenameDataIdFromObject),
            link: link
        )
    );
    return client;
  }

  static ValueNotifier<GraphQLClient> initializeClientAuth(String token) {
    _token = token;
    ValueNotifier<GraphQLClient> client =
    ValueNotifier(
        GraphQLClient(
            cache: InMemoryCache(), //OptimisticCache(dataIdFromObject: typenameDataIdFromObject),
            link: linkAuth
        )
    );
    return client;
  }

  GraphQLClient clientToQuery() {
    return GraphQLClient(
      link: link,
      cache: OptimisticCache(dataIdFromObject: typenameDataIdFromObject),
    );
  }

  GraphQLClient clientToQueryAuth(String token) {
    _token = token;
    return GraphQLClient(
      link: linkAuth,
      cache: OptimisticCache(dataIdFromObject: typenameDataIdFromObject),
    );
  }

}