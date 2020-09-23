

import 'package:json_annotation/json_annotation.dart' as j;

part 'Category.g.dart';

@j.JsonSerializable()
class Category {
  Category({
    this.id,
    this.name,
    this.surveyId,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String name;
  int surveyId;
  DateTime createdAt;
  DateTime updatedAt;

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryToJson(this);}


