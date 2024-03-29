import 'package:json_annotation/json_annotation.dart';

part 'info.g.dart';

@JsonSerializable()
class Info {
  final int count;
  final int pages;
  final String? next;

  Info(this.count, this.pages, this.next);

  factory Info.fromJson(Map<String, dynamic> json) =>
      _$InfoFromJson(json);

  Map<String, dynamic> toJson() => _$InfoToJson(this);

}