// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'description.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Description _$DescriptionFromJson(Map<String, dynamic> json) {
  return Description(
    finalScore: json['finalScore'] as String,
    googleLocation: json['googleLocation'] as String,
    surveyId: json['surveyId'] as int,
    surveyName: json['surveyName'] as String,
    town: json['town'] as String,
  );
}

Map<String, dynamic> _$DescriptionToJson(Description instance) =>
    <String, dynamic>{
      'finalScore': instance.finalScore,
      'googleLocation': instance.googleLocation,
      'surveyId': instance.surveyId,
      'surveyName': instance.surveyName,
      'town': instance.town,
    };
