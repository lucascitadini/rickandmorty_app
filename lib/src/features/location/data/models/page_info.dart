import 'package:json_annotation/json_annotation.dart';

part 'page_info.g.dart';

@JsonSerializable()
class PageInfo {
  final int count;
  final int pages;
  final int? next;

  PageInfo(this.count, this.pages, this.next);

  factory PageInfo.fromJson(Map<String, dynamic> json) =>
      _$PageInfoFromJson(json);

  Map<String, dynamic> toJson() => _$PageInfoToJson(this);

}