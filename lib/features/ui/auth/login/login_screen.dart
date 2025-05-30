import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gym_app_graduation_project/config/routing/routes.dart';
import 'package:gym_app_graduation_project/features/ui/auth/login/cubit/login_view_model.dart';

import '../../../../core/components/resuble_components.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_styels.dart';
import '../../../../core/utils/validators.dart';
import 'cubit/login_state.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    LoginViewModel viewModel=LoginViewModel();
    return BlocListener<LoginViewModel,LoginStates>(
      bloc: viewModel,
      listener: (context, state) {
        if(state is LoginSuccessState){
          Navigator.pushReplacementNamed(context, Routes.introBmiScreen);
        }
      },
      child: Scaffold(
        body: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 27.w),
          child: Form(
            key: viewModel.formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 100.h),
                  SvgPicture.asset(
                    AppImages.logoSvgLight,
                    semanticsLabel: 'logo',
                  ),
                  SizedBox(
                    height: 170.h,
                  ),
                  Text(
                    "Log in",
                    style: AppStyles.bold24black,
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  CustomTextFormField(
                    validator: AppValidators.validateEmail,
                    hintText: "Email",
                    controller: viewModel.emailController,
                    prefixIcon: Icon(
                      Icons.email,
                      color: AppColors.primaryColor,
                    ),
                  ),
                  SizedBox(
                    height: 26.h,
                  ),
                  CustomTextFormField(
                    validator: AppValidators.validatePassword,
                    hintText: "Password",
                    isObscure: true,
                    suffixIcon: Icons.visibility_off,
                    prefixIcon: Icon(Icons.lock),
                    controller: viewModel.passwordController,
                  ),
                  SizedBox(
                    height: 13.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Forgot Password?",
                        style: AppStyles.regular13primary,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 204.h,
                  ),
                  CustomElevatedButton(
                      text: "Log in",
                      onPressed: () {
                        viewModel.login();
                      }),
                  SizedBox(
                    height: 35.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        AppImages.guestIcon,
                        semanticsLabel: 'guestLogo',
                      ),
                      Text(
                        "  Login As Guest",
                        style: AppStyles.regular16primary,
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
