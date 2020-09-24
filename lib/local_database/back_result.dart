import 'package:json_annotation/json_annotation.dart' as j;

part 'back_result.g.dart';

@j.JsonSerializable()
class BackResults {
  String finalScore;
  int questionId;
  String score;

  BackResults({this.finalScore, this.questionId, this.score,});

  factory BackResults.fromJson(Map<String, dynamic> json) =>
      _$BackResultsFromJson(json);

  Map toJson() => _$BackResultsToJson(this);
}
