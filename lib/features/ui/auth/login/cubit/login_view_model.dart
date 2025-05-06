import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_app_graduation_project/features/ui/auth/login/cubit/login_state.dart';

class LoginViewModel extends Cubit<LoginStates> {
  LoginViewModel() :super(LoginInitialState());

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void login() {
    // emit(LoginLoadingState());
    if (formKey.currentState!.validate()) {
      emit(LoginSuccessState());
    }
  }
}