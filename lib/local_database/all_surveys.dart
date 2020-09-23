import 'package:survey_app/local_database/surveys.dart';

import 'package:json_annotation/json_annotation.dart' as j;

part 'all_surveys.g.dart';

@j.JsonSerializable()
class AllSurveys{
  Surveys surveys;

  AllSurveys({this.surveys});

  factory AllSurveys.fromJson(Map<String, dynamic> json) => _$AllSurveysFromJson(json);

  Map<String, dynamic> toJson() => _$AllSurveysToJson(this);


}