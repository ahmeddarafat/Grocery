import 'package:dio/dio.dart';

class DioHelper {
  static late Dio _dio;

  static init() {
    _dio = Dio(
      BaseOptions(
        baseUrl: "http://grocery-apid.herokuapp.com/api/",
        receiveDataWhenStatusError: true,
        connectTimeout: 3600,
        receiveTimeout: 3600,
      ),
    );
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
  })async {
    return await _dio.get(
      url,
      queryParameters: query,
    );
  }
  static Future<Response> postData({
    required String url,
    dynamic data,
    Map<String, dynamic>? query,
  })async {
    return await _dio.post(
      url,
      data: data,
      queryParameters: query,
    );
  }
}
