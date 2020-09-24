

import 'package:chopper/chopper.dart';
import 'package:survey_app/common/urls.dart';
import 'package:survey_app/local_database/responses.dart';


part 'response_services.chopper.dart';


@ChopperApi(baseUrl: '/survey')
abstract class ResponseServices extends ChopperService {


  @Post()
  Future<Response> sendResult(
      @Header('Authorization') String authKey,
      @Post() ResultResponses responses,
      );

//////////////////////////////////////////////
  static ResponseServices create() {
    final client = ChopperClient(
      baseUrl: mainUrl,
      services: [
        _$ResponseServices(),
      ],
      converter: JsonConverter(),
      // interceptors: [HttpLoggingInterceptor()],
    );
    return _$ResponseServices(client);
  }
}
