import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_app_graduation_project/data/repository/user_data/data_source/auth_remote_data_source.dart';
import 'package:gym_app_graduation_project/data/repository/user_data/data_source/auth_remote_data_source_impl.dart';
import 'package:gym_app_graduation_project/data/repository/user_data/repository/auth_repo.dart';
import 'package:gym_app_graduation_project/data/repository/user_data/repository/auth_repo_impl.dart';
import 'package:gym_app_graduation_project/features/ui/auth/login/cubit/login_state.dart';

import '../../../../../core/utils/cache_helper.dart';

class LoginViewModel extends Cubit<LoginStates> {
  late AuthRepo authRepo;

  LoginViewModel() : super(LoginInitialState()) {
    AuthRemoteDataSource authRemoteDataSource = AuthRemoteDataSourceImpl();
    authRepo = AuthRepoImpl(authRemoteDataSource: authRemoteDataSource);
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void login() async {
    if (!formKey.currentState!.validate()) {
      return;
    }
    emit(LoginLoadingState());
    try {
      var response = await authRepo.login(
        emailController.text,
        passwordController.text,
      );

      if (response.token != null) {
        CacheHelper.saveData(key: 'name', value: response.user!.name);
        CacheHelper.saveData(key: 'phone', value: response.user!.phoneNumber);
        CacheHelper.saveData(key: 'email', value: response.user!.email);
        CacheHelper.saveData(key: 'id', value: response.user!.id);
        print("id is: ${CacheHelper.getData(key: 'id')}");
        print(CacheHelper.getData(key: 'name'));
        emit(LoginSuccessState(user: response));
      } else {
        emit(LoginErrorState(error: response.message ?? "Login failed"));
      }
    } catch (e) {
      if (e is DioException) {
        final errorMessage = e.response?.data['message'] ?? e.toString();
        emit(LoginErrorState(error: errorMessage));
      } else {
        emit(LoginErrorState(error: e.toString()));
      }
    }
  }

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}