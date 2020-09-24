import 'package:chopper/chopper.dart';
import 'package:survey_app/common/urls.dart';
import 'package:survey_app/models/change_password_model.dart';

part 'change_password_services.chopper.dart';

@ChopperApi(baseUrl: '/change_password')
abstract class ChangePasswordServices extends ChopperService {
  @Post()
  Future<Response> changePassword(
      @Header('Authorization') String authKey,
      @Body() ChangePasswordModel changePasswordModel,
      );

//////////////////////////////////////////////
  static ChangePasswordServices create() {
    final client = ChopperClient(
      baseUrl: mainUrl,
      services: [
        _$ChangePasswordServices(),
      ],
      converter: JsonConverter(),
      // interceptors: [HttpLoggingInterceptor()],
    );
    return _$ChangePasswordServices(client);
  }
}
