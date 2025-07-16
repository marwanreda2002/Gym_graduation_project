import 'package:gym_app_graduation_project/data/models/UserLoginResponse.dart';

class LoginStates{}

class LoginErrorState extends LoginStates {
  final String error;

  LoginErrorState({required this.error});
}

class LoginSuccessState extends LoginStates {
  final UserLoginResponse user;

  LoginSuccessState({required this.user});
}

class LoginLoadingState extends LoginStates{}
class LoginInitialState extends LoginStates{}