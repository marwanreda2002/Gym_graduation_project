import '../../../models/UserLoginResponse.dart';
import '../../../models/user_register_response.dart';

abstract class AuthRemoteDataSource {
  Future<UserRegisterResponse> register(
      String name, String email, String password, String phoneNumber);

  Future<UserLoginResponse> login(String email, String password);
}
