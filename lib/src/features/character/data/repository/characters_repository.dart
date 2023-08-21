import 'package:rickandmorty_app/src/features/character/data/models/character_list.dart';

abstract class CharactersRepository {
  Future<CharacterList> getCharacters(String? urlPage);
}
