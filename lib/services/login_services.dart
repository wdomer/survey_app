import 'package:chopper/chopper.dart';
import 'package:survey_app/common/urls.dart';

part 'login_services.chopper.dart';

@ChopperApi(baseUrl: '/sanctum_token')
abstract class LoginServices extends ChopperService {
  @Post()
  Future<Response> login(
      @Body() loginModel,
      );

//////////////////////////////////////////////
  static LoginServices create() {
    final client = ChopperClient(
      baseUrl: mainUrl,
      services: [
        _$LoginServices(),
      ],
      converter: JsonConverter(),
      // interceptors: [HttpLoggingInterceptor()],
    );
    return _$LoginServices(client);
  }
}
