
import 'package:json_annotation/json_annotation.dart' as j;

part 'login_model.g.dart';

@j.JsonSerializable()
class LoginModel {

  String device_name;
  String name;
  String email;
  String password;

  LoginModel({this.device_name, this.name, this.email, this.password});

  factory LoginModel.fromJson(Map<String, dynamic> json) =>
      _$LoginModelFromJson(json);

  Map toJson() => _$LoginModelToJson(this);
}
