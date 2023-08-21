import 'package:rickandmorty_app/src/core/http_client/inject/rickandmorty_http_inject.dart';
import 'package:get_it/get_it.dart';

import 'package:rickandmorty_app/src/core/injects/characters_inject.dart';
import 'package:rickandmorty_app/src/core/injects/graphql_inject.dart';
import 'package:rickandmorty_app/src/core/injects/locations_inject.dart';

sealed class RickandmortyTestAppInject {
  static Future<void> configure(GetIt getIt) async {
    RickandmortyHttpInject.configure(getIt);
    GraphQLInject.configure(getIt);
    CharactersInject.configure(getIt);
    LocationsInject.configure(getIt);
  }
}
