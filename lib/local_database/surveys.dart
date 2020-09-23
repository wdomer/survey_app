import 'package:survey_app/local_database/data.dart';
import 'package:json_annotation/json_annotation.dart' as j;

part 'surveys.g.dart';

@j.JsonSerializable()
class Surveys {
  int currentPage;
  List<DataModel> data;

  Surveys({
    this.currentPage,
    this.data,
  });

  factory Surveys.fromJson(Map<String, dynamic> json) =>
      _$SurveysFromJson(json);

  Map<String, dynamic> toJson() => _$SurveysToJson(this);
}

//  Surveys.fromJson(Map<String, dynamic> json) {
//    currentPage = json['current_page'];
//    if (json['data'] != null) {
//      data = new List<DataModel>();
//      json['data'].forEach((v) {
//        data.add(new DataModel.fromJson(v));
//      });
//    }
//  }
//
//  Map<String, dynamic> toJson() {
//    final Map<String, dynamic> data = new Map<String, dynamic>();
//    data['current_page'] = this.currentPage;
//    if (this.data != null) {
//      data['data'] = this.data.map((v) => v.toJson()).toList();
//    }
//    return data;
//  }
//}
