
import 'package:json_annotation/json_annotation.dart' as j;

part 'change_password_model.g.dart';

@j.JsonSerializable()
class ChangePasswordModel{
  String password;

  ChangePasswordModel({this.password});

  factory ChangePasswordModel.fromJson(Map<String, dynamic> json) =>
      _$ChangePasswordModelFromJson(json);

  Map toJson() => _$ChangePasswordModelToJson(this);
}