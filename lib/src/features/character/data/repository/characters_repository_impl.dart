import 'dart:async';
import 'dart:convert';

import 'package:rickandmorty_app/src/core/errors/rickandmorty_exception.dart';
import 'package:rickandmorty_app/src/features/character/data/models/character_list.dart';
import 'package:rickandmorty_app/src/features/character/data/repository/characters_repository.dart';
import 'package:http/http.dart';

class CharactersRepositoryImpl implements CharactersRepository {
  final Client client;

  CharactersRepositoryImpl(this.client);

  @override
  Future<CharacterList> getCharacters(String? urlPage) async {
    try {
      final charResult = await client.get(
        Uri.parse(urlPage ?? 'https://rickandmortyapi.com/api/character'),
      );
      final jsonMap =
          await json.decode(charResult.body) as Map<String, dynamic>;
      return Future.value(
        CharacterList.fromJson(jsonMap),
      );
    } on ClientException catch (exception) {
      throw RickandmortyException(error: exception, message: exception.message);
    } catch (defaultException) {
      throw RickandmortyException(
        error: defaultException,
        message: 'Unexpected error',
      );
    }
  }
}
