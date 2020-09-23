import 'package:survey_app/local_database/Category.dart';
import 'package:survey_app/local_database/Question.dart';
import 'package:json_annotation/json_annotation.dart' as j;

part 'data.g.dart';

@j.JsonSerializable()
class DataModel {
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

  DataModel({
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

  factory DataModel.fromJson(Map<String, dynamic> json) =>
      _$DataModelFromJson(json);

  Map<String, dynamic> toJson() => _$DataModelToJson(this);}

//  DataModel.fromJson(Map<String, dynamic> json) {
//    id = json['id'];
//    name = json['name'];
//    uniqueUuid = json['unique_uuid'];
//    languages = json['languages'];
//    description = json['description'];
//    timer = json['timer'];
//    importantDates = json['important_dates'];
//    createdAt = json['created_at'];
//    updatedAt = json['updated_at'];
//    if (json['category'] != null) {
//      category = new List<Category>();
//      json['category'].forEach((v) {
//        category.add(new Category.fromJson(v));
//      });
//    }
//    if (json['question'] != null) {
//      question = new List<Question>();
//      json['question'].forEach((v) {
//        question.add(new Question.fromJson(v));
//      });
//    }
//  }

//  Map<String, dynamic> toJson() {
//    final Map<String, dynamic> data = new Map<String, dynamic>();
//    data['id'] = this.id;
//    data['name'] = this.name;
//    data['unique_uuid'] = this.uniqueUuid;
//    data['languages'] = this.languages;
//    data['description'] = this.description;
//    data['timer'] = this.timer;
//    data['important_dates'] = this.importantDates;
//    data['created_at'] = this.createdAt;
//    data['updated_at'] = this.updatedAt;
//    if (this.category != null) {
//      data['category'] = this.category.map((v) => v.toJson()).toList();
//    }
//    if (this.question != null) {
//      data['question'] = this.question.map((v) => v.toJson()).toList();
//    }
//    return data;
//  }




