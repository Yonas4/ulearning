import 'package:ulearning/common/entities/entities.dart';

import '../utils/http_util.dart';

class UserApi {
  static login({LoginRequestEntity? param}) async {
    var response = await HttpUtil().post(
      'api/login',
      queryParameters: param?.toJson(),
    );

    // print(response.toString()+'testttttttt');
    return UserLoginResponseEntity.fromJson(response);
  }
}
