import 'package:dio/dio.dart';
import 'package:gym_app_graduation_project/core/api/constant.dart';

class ApiManager {
  static late Dio dio;

  static void dioInit() {
    dio = Dio();
  }

  static Future<Response> postData(
      {required String endPoint,
      Map<String, dynamic>? queryParameters,
      Object? data,
      String? token}) {
    return dio.post(
      ApiConstant.baseUrl + endPoint,
      data: data,
      options: Options(headers: {
        'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    }),
      queryParameters: queryParameters,
    );
  }

  static Future<Response> getData({
    required String endPoint,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) {
    return dio.get(ApiConstant.baseUrl + endPoint,
        queryParameters: queryParameters, options: options);
  }
}
