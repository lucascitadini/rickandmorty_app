import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'character.g.dart';

@JsonSerializable()
class Character extends Equatable {
  final String name;
  final String image;
  final String status;
  final String species;
  final String gender;
  final String created;

  const Character(this.name, this.image, this.status, this.species, this.gender, this.created);

  factory Character.fromJson(Map<String, dynamic> json) =>
      _$CharacterFromJson(json);

  Map<String, dynamic> toJson() => _$CharacterToJson(this);
  
  @override
  List<Object> get props => [name, image, status, species, gender, created];
}
