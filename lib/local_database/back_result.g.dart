// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'back_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BackResults _$BackResultsFromJson(Map<String, dynamic> json) {
  return BackResults(
    finalScore: json['finalScore'] as String,
    questionId: json['questionId'] as int,
    score: json['score'] as String,
  );
}

Map<String, dynamic> _$BackResultsToJson(BackResults instance) =>
    <String, dynamic>{
      'finalScore': instance.finalScore,
      'questionId': instance.questionId,
      'score': instance.score,
    };
