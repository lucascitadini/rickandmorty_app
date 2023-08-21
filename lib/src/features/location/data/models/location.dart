import 'package:json_annotation/json_annotation.dart';

part 'location.g.dart';

@JsonSerializable()
class Location {
  final String id;
  final String name;
  final String type;
  final String dimension;

  Location(this.id, this.name, this.type, this.dimension);

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);

  Map<String, dynamic> toJson() => _$LocationToJson(this);
}