import 'package:gym_app_graduation_project/data/models/user_register_response.dart';

class RegisterStates{}
class RegisterErrorState extends RegisterStates{
  final String error;
  RegisterErrorState({required this.error});
}

class RegisterSuccessState extends RegisterStates {
  UserRegisterResponse user;

  RegisterSuccessState({required this.user});
}

class RegisterLoadingState extends RegisterStates{}
class RegisterInitialState extends RegisterStates{}