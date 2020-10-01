import 'back_result.dart';
import 'description.dart';
import 'package:json_annotation/json_annotation.dart' as j;

part 'responses.g.dart';

@j.JsonSerializable()
class ResultResponses {
  Description description;
  List<BackResults> responses;

  ResultResponses({
    this.description,
    this.responses,
  });

  factory ResultResponses.fromJson(Map<String, dynamic> json) =>
      _$ResultResponsesFromJson(json);

  Map toJson() => _$ResultResponsesToJson(this);
}
