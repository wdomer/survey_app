// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'surveys_all_services_local.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$SurveysAllServicesLocal extends SurveysAllServicesLocal {
  _$SurveysAllServicesLocal([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = SurveysAllServicesLocal;

  @override
  Future<Response<dynamic>> getSurveysLocal(String authKey, int page) {
    final $url = '/survey';
    final $params = <String, dynamic>{'page': page};
    final $headers = {'Authorization': authKey};
    final $request = Request('GET', $url, client.baseUrl,
        parameters: $params, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }
}
