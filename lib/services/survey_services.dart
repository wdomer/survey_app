//
//
//import 'package:chopper/chopper.dart';
//import 'package:survey_app/common/urls.dart';
//import 'package:survey_app/services/converter_json.dart';
//import 'package:built_collection/built_collection.dart';
//import 'package:survey_app/models/built_survey.dart';
//
//part 'survey_services.chopper.dart';
//
//@ChopperApi(baseUrl: '/survey')
//abstract class SurveyServices extends ChopperService {
//  @Get()
//  Future<Response<BuiltSurvey>> getSurveys(
//      @Header('Authorization') String authKey,
//    @Query() int page,
//  );
//
//
//
////////////////////////////////////////////////
//  static SurveyServices create() {
//    final client = ChopperClient(
//      baseUrl: mainUrl,
//      services: [
//        _$SurveyServices(),
//      ],
//      converter: ConverterJson(),
//      // interceptors: [HttpLoggingInterceptor()],
//    );
//    return _$SurveyServices(client);
//  }
//}
