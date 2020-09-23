
import 'package:json_annotation/json_annotation.dart' as j;

part 'Question.g.dart';

@j.JsonSerializable()
class Question {
  Question({
    this.id,
    this.question,
    this.weightage,
    this.options,
    this.surveyId,
    this.categoryId,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String question;
  String weightage;
  String options;
  int surveyId;
  int categoryId;
  DateTime createdAt;
  DateTime updatedAt;

  factory Question.fromJson(Map<String, dynamic> json) =>
      _$QuestionFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionToJson(this);}


