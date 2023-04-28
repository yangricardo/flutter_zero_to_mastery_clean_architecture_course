import 'package:chopper/chopper.dart';

class UserConverter implements Converter {
  @override
  Response<User> convertResponse<User, InnerType>(Response response) {
    var body = response.body;
    // Convert body to BodyType however you like
    return response.copyWith<User>(body: body);
  }

  @override
  Request convertRequest(Request request) {
    var body = request.body;
    // Convert body to String however you like
    return request.copyWith(body: body);
  }
}
