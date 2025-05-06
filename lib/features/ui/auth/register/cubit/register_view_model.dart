import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_app_graduation_project/features/ui/auth/register/cubit/register_states.dart';

class RegisterViewModel extends Cubit<RegisterStates>{
  RegisterViewModel():super(RegisterInitialState());

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void register(){
    // emit(RegisterLoadingState());
    if(formKey.currentState!.validate()){
      emit(RegisterSuccessState());
    }else{
      emit(RegisterErrorState(error: "error"));
    }

  }

}