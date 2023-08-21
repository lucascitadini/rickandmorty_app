// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocationList _$LocationListFromJson(Map<String, dynamic> json) => LocationList(
      PageInfo.fromJson(json['info'] as Map<String, dynamic>),
      (json['results'] as List<dynamic>)
          .map((e) => Location.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LocationListToJson(LocationList instance) =>
    <String, dynamic>{
      'info': instance.info,
      'results': instance.results,
    };
