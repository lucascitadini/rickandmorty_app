import 'package:rickandmorty_app/src/features/character/data/models/character.dart';
import 'package:rickandmorty_app/src/features/character/data/models/info.dart';
import 'package:json_annotation/json_annotation.dart';

part 'character_list.g.dart';

@JsonSerializable()
class CharacterList {
  final Info info;
  final List<Character> results;

  CharacterList(this.info, this.results);

  factory CharacterList.fromJson(Map<String, dynamic> json) =>
      _$CharacterListFromJson(json);

  Map<String, dynamic> toJson() => _$CharacterListToJson(this);
}
