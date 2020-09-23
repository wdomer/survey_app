

import 'package:chopper/chopper.dart';
import 'package:survey_app/common/urls.dart';


part 'surveys_all_services_local.chopper.dart';


@ChopperApi(baseUrl: '/survey')
abstract class SurveysAllServicesLocal extends ChopperService {


  @Get()
  Future<Response> getSurveysLocal(
      @Header('Authorization') String authKey,
      @Query() int page,
      );

//////////////////////////////////////////////
  static SurveysAllServicesLocal create() {
    final client = ChopperClient(
      baseUrl: mainUrl,
      services: [
        _$SurveysAllServicesLocal(),
      ],
      converter: JsonConverter(),
      // interceptors: [HttpLoggingInterceptor()],
    );
    return _$SurveysAllServicesLocal(client);
  }
}
