import 'dart:io';

import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

String get host => Platform.isAndroid ? '10.0.2.2' : 'localhost';
final httpLink = HttpLink("http://10.0.2.2:4000/query");

///Graph QL Client
ValueNotifier<GraphQLClient> client = ValueNotifier(
    GraphQLClient(cache: GraphQLCache(store: InMemoryStore()), link: httpLink));
