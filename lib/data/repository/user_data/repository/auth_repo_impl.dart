import 'package:gym_app_graduation_project/data/models/UserLoginResponse.dart';
import 'package:gym_app_graduation_project/data/models/user_register_response.dart';
import 'package:gym_app_graduation_project/data/repository/user_data/data_source/auth_remote_data_source.dart';
import 'package:gym_app_graduation_project/data/repository/user_data/repository/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  AuthRemoteDataSource authRemoteDataSource;

  AuthRepoImpl({required this.authRemoteDataSource});

  @override
  Future<UserRegisterResponse> register(
      String name, String email, String password, String phoneNumber) {
    return authRemoteDataSource.register(name, email, password, phoneNumber);
  }

  @override
  Future<UserLoginResponse> login(String email, String password) {
    return authRemoteDataSource.login(email, password);
  }
}
