import 'package:dio/dio.dart';

class DioUtil {
  static Dio dio;

  factory DioUtil() => _getInstance();
  static DioUtil _instance;

  DioUtil._() {}

  static DioUtil _getInstance() {
    if (_instance == null) {
      _instance = DioUtil._();
      dio = Dio();
      dio.options.baseUrl = "https://express-beta2.hachi-tech.com";
      dio.options.connectTimeout = 5000;
      dio.options.receiveTimeout = 3000;
    }
    return _instance;
  }

  Future<String> get(String url, Map<String, Object> param) async {
    Response response = await dio.get(url, queryParameters: param);
    return response.toString();
  }

  Future<String> post(String url, Map<String, Object> param) async {
    Response response = await dio.request(url, data: param);
    print(response.toString());
    return response.toString();
  }
}
