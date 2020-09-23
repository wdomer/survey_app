// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_services.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$LoginServices extends LoginServices {
  _$LoginServices([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = LoginServices;

  @override
  Future<Response<dynamic>> login(dynamic loginModel) {
    final $url = '/sanctum_token';
    final $body = loginModel;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }
}
