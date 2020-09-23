import 'package:json_annotation/json_annotation.dart' as j;

part 'results.g.dart';

@j.JsonSerializable()
class AllResults {
  String finalScore;
  int questionId;
  String score;
  String option;

  AllResults({this.finalScore, this.questionId, this.score, this.option});

  factory AllResults.fromJson(Map<String, dynamic> json) =>
      _$AllResultsFromJson(json);

  Map toJson() => _$AllResultsToJson(this);
}
