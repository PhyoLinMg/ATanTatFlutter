import 'package:chopper/chopper.dart';

part 'service.chopper.dart';

@ChopperApi(baseUrl: '/majors')
abstract class service extends ChopperService {
  @Get()
  Future<Response> getMajor();

  static service create() {
    final client = ChopperClient(
      baseUrl: 'http://atantat.herokuapp.com/api',
      services: [
        _$service(),
      ],
      converter: JsonConverter(),
    );
    return _$service(client);
  }
}
