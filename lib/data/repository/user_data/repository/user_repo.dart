// import 'package:dartz/dartz.dart';
// import '../../models/user_login_model.dart';
// import '../../models/user_register_response.dart';
//
// abstract class UserRepo {
//   Future<Either<String, UserLoginResponse>> login({
//     required String email,
//     required String password,
//   });
//
//   Future<Either<String, UserRegisterResponse>> register({
//     required String email,
//     required String password,
//     required String firstName,
//     required String lastName,
//     required String phoneNumber,
//     String? profileImage,
//   });
//
//   Future<Either<String, UserLoginResponse>> getCurrentUser();
//
//   Future<Either<String, bool>> updateProfile({
//     required String firstName,
//     required String lastName,
//     required String phoneNumber,
//     String? profileImage,
//   });
//
//   Future<Either<String, bool>> logout();
//
//   Future<Either<String, bool>> saveUserImage(String imagePath);
//
//   Future<Either<String, String?>> getUserImage();
// }
