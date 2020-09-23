// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'surveys.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Surveys _$SurveysFromJson(Map<String, dynamic> json) {
  return Surveys(
    currentPage: json['currentPage'] as int,
    data: (json['data'] as List)
        ?.map((e) =>
            e == null ? null : DataModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$SurveysToJson(Surveys instance) => <String, dynamic>{
      'currentPage': instance.currentPage,
      'data': instance.data,
    };
