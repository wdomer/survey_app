//// GENERATED CODE - DO NOT MODIFY BY HAND
//
//part of 'surveys_all_services.dart';
//
//// **************************************************************************
//// ChopperGenerator
//// **************************************************************************
//
//// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
//class _$SurveysAllServices extends SurveysAllServices {
//  _$SurveysAllServices([ChopperClient client]) {
//    if (client == null) return;
//    this.client = client;
//  }
//
//  @override
//  final definitionType = SurveysAllServices;
//
//  @override
//  Future<Response<BuiltAllSurveys>> getSurveys(String authKey, int page) {
//    final $url = '/survey';
//    final $params = <String, dynamic>{'page': page};
//    final $headers = {'Authorization': authKey};
//    final $request = Request('GET', $url, client.baseUrl,
//        parameters: $params, headers: $headers);
//    return client.send<BuiltAllSurveys, BuiltAllSurveys>($request);
//  }
//
//  @override
//  Future<Response<AllSurveys>> getSurveysLocal(String authKey, int page) {
//    final $url = '/survey';
//    final $params = <String, dynamic>{'page': page};
//    final $headers = {'Authorization': authKey};
//    final $request = Request('GET', $url, client.baseUrl,
//        parameters: $params, headers: $headers);
//    return client.send<AllSurveys, AllSurveys>($request);
//  }
//}
