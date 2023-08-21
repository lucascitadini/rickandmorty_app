// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocationDetail _$LocationDetailFromJson(Map<String, dynamic> json) =>
    LocationDetail(
      json['id'] as String,
      json['name'] as String,
      json['type'] as String,
      json['dimension'] as String,
      json['created'] as String,
      (json['residents'] as List<dynamic>)
          .map((e) => Character.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LocationDetailToJson(LocationDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'dimension': instance.dimension,
      'created': instance.created,
      'residents': instance.residents,
    };
