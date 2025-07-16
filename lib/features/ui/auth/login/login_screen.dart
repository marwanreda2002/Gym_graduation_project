import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gym_app_graduation_project/config/routing/routes.dart';
import 'package:gym_app_graduation_project/core/cache/cache_helper.dart';
import 'package:gym_app_graduation_project/features/ui/auth/login/cubit/login_view_model.dart';

import '../../../../core/components/resuble_components.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_styels.dart';
import '../../../../core/utils/validators.dart';
import 'cubit/login_state.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isPasswordObscured = true;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginViewModel(),
      child: BlocConsumer<LoginViewModel, LoginStates>(
        listener: (context, state) {
          if (state is LoginSuccessState) {
            CashHelper.saveData(key: 'token', value: state.user.token);
            Navigator.pushReplacementNamed(context, Routes.homeScreen);
          }
          if (state is LoginErrorState) {
            _showErrorDialog(context, state.error);
          }
        },
        builder: (context, state) {
          final viewModel = BlocProvider.of<LoginViewModel>(context);
          return Scaffold(
            body: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              AppColors.primaryColor,
                              AppColors.whiteColor,
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                        child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 27.w),
                            child: Column(
                              children: [
                                SizedBox(height: 100.h),
                                SvgPicture.asset(
                                  AppImages.logoSvgLight,
                                  semanticsLabel: 'logo',
                                  height: 75.h,
                                )
                              ],
                            )),
                      ),
                      Container(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 27.w),
                          child: Form(
                            key: viewModel.formKey,
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  SizedBox(
                                    height: 50.h,
                                  ),
                                  Text(
                                    "Log in",
                                    style: AppStyles.bold36Primary,
                                  ),
                                  SizedBox(
                                    height: 8.h,
                                  ),
                                  Text(
                                    "fill in your essential information to get started",
                                    style: AppStyles.regular15grey,
                                  ),
                                  SizedBox(
                                    height: 30.h,
                                  ),
                                  Text(
                                    "Email",
                                    style: AppStyles.regular13grey,
                                  ),
                                  SizedBox(height: 8.h),
                                  CustomTextFormField(
                                    validator: AppValidators.validateEmail,
                                    hintText: "Email",
                                    controller: viewModel.emailController,
                                  ),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  Text(
                                    "password",
                                    style: AppStyles.regular13grey,
                                  ),
                                  SizedBox(height: 8.h),
                                  CustomTextFormField(
                                    validator: AppValidators.validatePassword,
                                    hintText: "Password",
                                    isObscure: _isPasswordObscured,
                                    onSuffixPressed: () {
                                      setState(() {
                                        _isPasswordObscured =
                                            !_isPasswordObscured;
                                      });
                                    },
                                    suffixIcon: _isPasswordObscured
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    controller: viewModel.passwordController,
                                  ),
                                  SizedBox(
                                    height: 13.h,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          // Forgot password action
                                        },
                                        child: Text(
                                          "Forgot your password?",
                                          style: AppStyles.regular13primary,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 40.h,
                                  ),
                                  CustomElevatedButton(
                                      text: "Log in",
                                      textStyle: AppStyles.regular18white,
                                      onPressed: state is LoginLoadingState
                                          ? null
                                          : () {
                                              viewModel.login();
                                            }),
                                  SizedBox(
                                    height: 25.h,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Don't have account ",
                                        style: AppStyles.regular13black,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Navigator.pushNamed(
                                              context, Routes.registerScreen);
                                        },
                                        child: Text(
                                          "Sign up",
                                          style: AppStyles.bold13primary,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 25.h,
                                  ),
                                  OutlinedButton(
                                    onPressed: () {
                                      Navigator.pushReplacementNamed(
                                          context, Routes.homeScreen);
                                    },
                                    style: OutlinedButton.styleFrom(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 16.h),
                                      side: BorderSide(
                                          color: AppColors.primaryColor),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.r),
                                      ),
                                    ),
                                    child: Text(
                                      "Login As Guest",
                                      style: AppStyles.regular16primary,
                                    ),
                                  ),
                                  SizedBox(height: 20.h),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                if (state is LoginLoadingState)
                  Container(
                    color: Colors.black.withOpacity(0.5),
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }

  void _showErrorDialog(BuildContext context, String errorMessage) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Login Error',
            style: AppStyles.bold16primary,
          ),
          content: Text(
            errorMessage,
            style: AppStyles.regular16black,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'OK',
                style: AppStyles.medium16primary,
              ),
            ),
          ],
        );
      },
    );
  }
}
