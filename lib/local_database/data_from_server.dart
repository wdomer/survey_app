
import 'package:json_annotation/json_annotation.dart' as j;

import 'Category.dart';
import 'Question.dart';

part 'data_from_server.g.dart';

@j.JsonSerializable()
class DataFromServer {
  int id;
  String name;
  String uniqueUuid;
  String languages;
  String description;
  String timer;
  String importantDates;
  String createdAt;
  String updatedAt;
  List<Category> category;
  List<Question> question;

  DataFromServer({
    this.id,
    this.name,
    this.uniqueUuid,
    this.languages,
    this.description,
    this.timer,
    this.importantDates,
    this.createdAt,
    this.updatedAt,
    this.category,
    this.question});

  factory DataFromServer.fromJson(Map<String, dynamic> json) =>
      _$DataFromServerFromJson(json);

  Map<String, dynamic> toJson() => _$DataFromServerToJson(this);}
