// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_surveys.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllSurveys _$AllSurveysFromJson(Map<String, dynamic> json) {
  return AllSurveys(
    surveys: json['surveys'] == null
        ? null
        : Surveys.fromJson(json['surveys'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$AllSurveysToJson(AllSurveys instance) =>
    <String, dynamic>{
      'surveys': instance.surveys,
    };
