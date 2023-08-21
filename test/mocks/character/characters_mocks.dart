import 'dart:convert';

import 'package:rickandmorty_app/src/features/character/data/models/character.dart';
import 'package:rickandmorty_app/src/features/character/data/models/character_list.dart';
import 'package:rickandmorty_app/src/features/character/data/models/info.dart';

class CharactersMocks {
  CharactersMocks._();

  static CharacterList characterList = CharacterList.fromJson(
      json.decode(getCharactersJson) as Map<String, dynamic>,);

  static List<Character> characters = characterList.results;

  static Character character = characters.first;

  static List<Character> twiceCharacters = [...characters, ...characters];

  static Info info = characterList.info;

  static const getCharactersUrlBase =
      'https://rickandmortyapi.com/api/character/?page=1';

  static const getCharactersJson = '''{
      "info": {
          "count": 826,
          "pages": 42,
          "next": "https://rickandmortyapi.com/api/character/?page=2",
          "prev": null
      },
      "results": [
          {
              "id": 1,
              "name": "Rick Sanchez",
              "status": "Alive",
              "species": "Human",
              "type": "",
              "gender": "Male",
              "origin": {
                  "name": "Earth",
                  "url": "https://rickandmortyapi.com/api/location/1"
              },
              "location": {
                  "name": "Earth",
                  "url": "https://rickandmortyapi.com/api/location/20"
              },
              "image": "https://rickandmortyapi.com/api/character/avatar/1.jpeg",
              "episode": [
                  "https://rickandmortyapi.com/api/episode/1",
                  "https://rickandmortyapi.com/api/episode/2"
              ],
              "url": "https://rickandmortyapi.com/api/character/1",
              "created": "2017-11-04T18:48:46.250Z"
          }
      ]
  }''';
}
