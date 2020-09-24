// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_password_services.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$ChangePasswordServices extends ChangePasswordServices {
  _$ChangePasswordServices([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = ChangePasswordServices;

  @override
  Future<Response<dynamic>> changePassword(
      String authKey, ChangePasswordModel changePasswordModel) {
    final $url = '/change_password';
    final $headers = {'Authorization': authKey};
    final $body = changePasswordModel;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }
}
