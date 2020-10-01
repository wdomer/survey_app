

import 'package:chopper/chopper.dart';

import '../common/urls.dart';
import '../local_database/responses.dart';


part 'response_services.chopper.dart';


@ChopperApi(baseUrl: '/question_response')
abstract class ResponseServices extends ChopperService {


  @Post()
  Future<Response> sendResult(
      @Header('Authorization') String authKey,
      @Body() ResultResponses responses,
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
