import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_app_graduation_project/data/repository/user_data/repository/auth_repo.dart';
import 'package:gym_app_graduation_project/data/repository/user_data/repository/auth_repo_impl.dart';
import 'package:gym_app_graduation_project/features/ui/auth/register/cubit/register_states.dart';

import '../../../../../core/cache/cache_helper.dart';
import '../../../../../data/repository/user_data/data_source/auth_remote_data_source.dart';
import '../../../../../data/repository/user_data/data_source/auth_remote_data_source_impl.dart';

class RegisterViewModel extends Cubit<RegisterStates> {
  late AuthRepo authRepo;

  RegisterViewModel() : super(RegisterInitialState()) {
    AuthRemoteDataSource authRemoteDataSource = AuthRemoteDataSourceImpl();
    authRepo = AuthRepoImpl(authRemoteDataSource: authRemoteDataSource);
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();

  TextEditingController phoneController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void register() async {
    emit(RegisterLoadingState());

    try {
      if (formKey.currentState!.validate()) {
        String fullName =
            "${firstNameController.text} ${lastNameController.text}";
        var response = await authRepo.register(fullName, emailController.text,
            passwordController.text, phoneController.text);

        if (response.token != null) {
          CashHelper.saveData(key: 'token', value: response.token);
          CashHelper.saveData(key: 'name', value: response.user?.name);
          CashHelper.saveData(key: 'email', value: response.user?.email);
          CashHelper.saveData(key: 'phone', value: response.user?.phoneNumber);
          emit(RegisterSuccessState(user: response));
        } else {
          emit(RegisterErrorState(
              error: response.message ?? "Registration failed"));
        }
      } else {
        emit(RegisterErrorState(
            error: "Please fill all required fields correctly"));
      }
    } catch (e) {
      if (e is DioException) {
        final errorMessage = e.response?.data['message'] ?? e.toString();
        emit(RegisterErrorState(error: errorMessage));
      } else {
        emit(RegisterErrorState(error: e.toString()));
      }
    }
  }

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    phoneController.dispose();
    confirmPasswordController.dispose();
    return super.close();
  }
}
