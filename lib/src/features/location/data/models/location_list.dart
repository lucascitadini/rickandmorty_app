import 'package:rickandmorty_app/src/features/location/data/models/page_info.dart';
import 'package:rickandmorty_app/src/features/location/data/models/location.dart';
import 'package:json_annotation/json_annotation.dart';

part 'location_list.g.dart';

@JsonSerializable()
class LocationList {
  final PageInfo info;
  final List<Location> results;

  LocationList(this.info, this.results);

  factory LocationList.fromJson(Map<String, dynamic> json) =>
      _$LocationListFromJson(json);

  Map<String, dynamic> toJson() => _$LocationListToJson(this);
}
