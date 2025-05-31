import 'package:dio/dio.dart';
import 'package:gym_app_graduation_project/core/api/constant.dart';

class DioHelper {
  static late Dio dio;

  static void dioInit() {
    dio = Dio(BaseOptions(
      baseUrl: ApiConstant.paymentBaseUrl,
      receiveDataWhenStatusError: true,
    ));
  }

  static Future<Response> postData({required String endPoint, required Map<
      String,
      dynamic> data, String? token}) {
    return dio.post(endPoint, data: data, options: Options(headers: {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    }));
  }

  static Future<Response> getData({required String endPoint, required Map<
      String,
      dynamic> queryParameters}) {
    return dio.get(endPoint, queryParameters: queryParameters);
  }
}
