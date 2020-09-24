import 'package:json_annotation/json_annotation.dart' as j;


part 'description.g.dart';

@j.JsonSerializable()
class Description{
  // String dateOfSubmission;
   String finalScore;
   String googleLocation;
   int surveyId;
   String surveyName;
   String town;

   Description({
    //  this.dateOfSubmission,
      this.finalScore,
      this.googleLocation,
      this.surveyId,
      this.surveyName,
      this.town,});

   factory Description.fromJson(Map<String, dynamic> json) =>
       _$DescriptionFromJson(json);

   Map<String, dynamic> toJson() => _$DescriptionToJson(this);
}