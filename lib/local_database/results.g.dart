// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'results.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllResults _$AllResultsFromJson(Map<String, dynamic> json) {
  return AllResults(
    finalScore: json['finalScore'] as String,
    questionId: json['questionId'] as int,
    score: json['score'] as String,
    option: json['option'] as String,
  );
}

Map<String, dynamic> _$AllResultsToJson(AllResults instance) =>
    <String, dynamic>{
      'finalScore': instance.finalScore,
      'questionId': instance.questionId,
      'score': instance.score,
      'option': instance.option,
    };
