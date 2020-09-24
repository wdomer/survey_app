// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_services.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$ResponseServices extends ResponseServices {
  _$ResponseServices([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = ResponseServices;

  @override
  Future<Response<dynamic>> sendResult(
      String authKey, ResultResponses responses) {
    final $url = '/question_response';
    final $headers = {'Authorization': authKey};
    final $body = responses;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }
}
