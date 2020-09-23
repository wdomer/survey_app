import 'package:survey_app/local_database/description.dart';
import 'package:survey_app/local_database/results.dart';
import 'package:json_annotation/json_annotation.dart' as j;

part 'responses.g.dart';

@j.JsonSerializable()
class ResultResponses {
  Description description;
  List<AllResults> results;

  ResultResponses({
    this.description,
    this.results,
  });

  factory ResultResponses.fromJson(Map<String, dynamic> json) =>
      _$ResultResponsesFromJson(json);

  Map toJson() => _$ResultResponsesToJson(this);
}
