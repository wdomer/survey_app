// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'responses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResultResponses _$ResultResponsesFromJson(Map<String, dynamic> json) {
  return ResultResponses(
    description: json['description'] == null
        ? null
        : Description.fromJson(json['description'] as Map<String, dynamic>),
    results: (json['results'] as List)
        ?.map((e) =>
            e == null ? null : AllResults.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ResultResponsesToJson(ResultResponses instance) =>
    <String, dynamic>{
      'description': instance.description,
      'results': instance.results,
    };
