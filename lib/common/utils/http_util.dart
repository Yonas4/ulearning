import 'package:dio/dio.dart';
import 'package:ulearning/common/Value/constant.dart';

class HttpUtil {
  static final HttpUtil _instance = HttpUtil._internal();

  factory HttpUtil() {
    return _instance;
  }

  late Dio dio;

  HttpUtil._internal() {
    BaseOptions options = BaseOptions(
        baseUrl: AppConstant.SERVER_API_URL,
        connectTimeout: const Duration(seconds: 5),
        receiveTimeout: const Duration(seconds: 5),
        headers: {},
        contentType: "application/json: charset=uft-8",
        responseType: ResponseType.json);

    dio = Dio(options);
  }

  Future post(String path,
      {dynamic data, Map<String, dynamic>? queryParameters}) async {
    var response =
        await dio.post(path, data: data, queryParameters: queryParameters);

    print('my response data is ${response.toString()}');

    return response.data;
  }
}
