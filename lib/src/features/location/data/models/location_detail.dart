import 'package:rickandmorty_app/src/features/character/data/models/character.dart';
import 'package:json_annotation/json_annotation.dart';

part 'location_detail.g.dart';

@JsonSerializable()
class LocationDetail {
  final String id;
  final String name;
  final String type;
  final String dimension;
  final String created;
  final List<Character> residents;

  LocationDetail(this.id, this.name, this.type, this.dimension, this.created,
      this.residents,);

  factory LocationDetail.fromJson(Map<String, dynamic> json) =>
      _$LocationDetailFromJson(json);

  Map<String, dynamic> toJson() => _$LocationDetailToJson(this);
}
