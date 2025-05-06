import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gym_app_graduation_project/config/routing/routes.dart';
import 'package:gym_app_graduation_project/core/utils/app_images.dart';
import 'package:gym_app_graduation_project/core/utils/validators.dart';
import 'package:gym_app_graduation_project/features/ui/auth/register/cubit/register_view_model.dart';

import '../../../../core/components/resuble_components.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styels.dart';
import '../../../../core/utils/dialogs.dart';
import 'cubit/register_states.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  RegisterViewModel viewModel=RegisterViewModel();
  @override
  Widget build(BuildContext context) {

    return BlocListener<RegisterViewModel,RegisterStates>(
      bloc: viewModel,
      listener: (context, state) {
        if(state is RegisterSuccessState){
          CustomDialog.showAlert(context: context, message: "Success",posActionName: "ok",posAction: (){
            Navigator.pushReplacementNamed(context, Routes.introBmiScreen);
          });
        }

      },
      child: Scaffold(
       body: Padding(
         padding:  EdgeInsets.symmetric(horizontal: 27.w),
         child: Form(
           key:viewModel.formKey ,
           child: SingleChildScrollView(
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.stretch,
               children: [
                 SizedBox(height:100.h),
               SvgPicture.asset(
               AppImages.logoSvgLight,
               semanticsLabel: 'logo',
             ),
                 SizedBox(height:110.h,),
                 Text("Sign up",style: AppStyles.bold24black,),
                 SizedBox(height:  25.h,),
                 CustomTextFormField(
                   validator: AppValidators.validateEmail,
                   hintText: "Email",
                   controller: viewModel.emailController,
                   prefixIcon: Icon(Icons.email,color: AppColors.primaryColor,),
                 ),
                 SizedBox(height:  15.h,),
                 CustomTextFormField(
                   validator: AppValidators.validateUsername,
                   hintText: "username",
                   controller: viewModel.usernameController,
                   prefixIcon: Icon(Icons.person,color: AppColors.primaryColor,),
                 ),
                 SizedBox(height:  15.h,),
                 CustomTextFormField(
                   validator: AppValidators.validatePhoneNumber,
                   hintText: "mobile number",
                   controller: viewModel.phoneController,
                   prefixIcon: Icon(Icons.phone,color: AppColors.primaryColor,),
                 ),
                 SizedBox(height:  15.h,),
                 CustomTextFormField(
                   validator: AppValidators.validatePassword,
                   isObscure: true,
                   hintText: "Password",
                   suffixIcon: Icons.visibility_off,
                   prefixIcon: Icon(Icons.lock),
                   controller: viewModel.passwordController,
                 ),
                 SizedBox(height:  15.h,),
                 CustomTextFormField(
                   validator: AppValidators.validatePassword,
                   isObscure: true,
                   hintText: "confirm password",
                   suffixIcon: Icons.visibility_off,
                   prefixIcon: Icon(Icons.lock),
                   controller: viewModel.confirmPasswordController,
                 ),
                   
                 SizedBox(height:  136.h,),
                 CustomElevatedButton(text: "Sign up", onPressed: (){
                   viewModel.register();
                 }),
                 SizedBox(height:  11.h,),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     Text("Already have account?",style:AppStyles.regular13black ,),
                     InkWell(
                       onTap: (){
                         Navigator.pushReplacementNamed(context, Routes.loginScreen);
                       },
                         child: Text(" Login",style:AppStyles.bold13primary ,)),
                   
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
