import 'package:gym_app_graduation_project/data/models/UserLoginResponse.dart';
import 'package:gym_app_graduation_project/data/models/user_register_response.dart';

import '../../../../core/api/api_manager.dart';
import '../../../../core/api/end_points.dart';
import '../../../../core/utils/cache_helper.dart';
import 'auth_remote_data_source.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  @override
  Future<UserRegisterResponse> register(
      String name, String email, String password, String phoneNumber) async {
    var response = await ApiManager.postData(
      endPoint: EndPoints.register,
      data: {
        "name": name,
        "email": email,
        "password": password,
        "phoneNumber": phoneNumber,
      },
    );
    UserRegisterResponse userRegisterResponse =
        UserRegisterResponse.fromJson(response.data);
    return userRegisterResponse;
  }

  @override
  Future<UserLoginResponse> login(String email, String password) async {
    var response = await ApiManager.postData(
      endPoint: EndPoints.login,
      data: {
        "email": email,
        "password": password,
      },
    );
    UserLoginResponse userLoginResponse =
        UserLoginResponse.fromJson(response.data);
    return userLoginResponse;
  }
}
