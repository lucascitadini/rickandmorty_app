// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CharacterList _$CharacterListFromJson(Map<String, dynamic> json) =>
    CharacterList(
      Info.fromJson(json['info'] as Map<String, dynamic>),
      (json['results'] as List<dynamic>)
          .map((e) => Character.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CharacterListToJson(CharacterList instance) =>
    <String, dynamic>{
      'info': instance.info,
      'results': instance.results,
    };
