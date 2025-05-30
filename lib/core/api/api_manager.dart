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

  static Future<Response> postData(
      {required String endPoint, required Map<String, dynamic> data}) {
    return dio.post(endPoint, data: data);
  }

  static Future<Response> getData({required String endPoint, required Map<
      String,
      dynamic> queryParameters}) {
    return dio.get(endPoint, queryParameters: queryParameters);
  }
}
