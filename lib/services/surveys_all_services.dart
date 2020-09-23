//
//
//import 'package:chopper/chopper.dart';
//import 'package:survey_app/common/urls.dart';
//import 'package:survey_app/local_database/all_surveys.dart';
//import 'package:survey_app/models/built_all_surveys.dart';
//import 'package:survey_app/services/converter_json.dart';
//import 'package:survey_app/models/built_survey.dart';
//
//part 'surveys_all_services.chopper.dart';
//
//
//@ChopperApi(baseUrl: '/survey')
//abstract class SurveysAllServices extends ChopperService {
////  @Get()
////  Future<Response<BuiltAllSurveys>> getSurveys(
////      @Header('Authorization') String authKey,
////      @Query() int page,
////      );
//
//  @Get()
//  Future<Response<AllSurveys>> getSurveysLocal(
//      @Header('Authorization') String authKey,
//      @Query() int page,
//      );
//
////////////////////////////////////////////////
//  static SurveysAllServices create() {
//    final client = ChopperClient(
//      baseUrl: mainUrl,
//      services: [
//        _$SurveysAllServices(),
//      ],
//      converter: ConverterJson(),
//      // interceptors: [HttpLoggingInterceptor()],
//    );
//    return _$SurveysAllServices(client);
//  }
//}
