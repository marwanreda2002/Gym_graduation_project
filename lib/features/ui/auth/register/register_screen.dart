import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gym_app_graduation_project/config/routing/routes.dart';
import 'package:gym_app_graduation_project/core/utils/app_images.dart';
import 'package:gym_app_graduation_project/core/utils/validators.dart';
import 'package:gym_app_graduation_project/data/repository/user_data/data_source/auth_remote_data_source.dart';
import 'package:gym_app_graduation_project/data/repository/user_data/repository/auth_repo.dart';
import 'package:gym_app_graduation_project/data/repository/user_data/repository/auth_repo_impl.dart';
import 'package:gym_app_graduation_project/features/ui/auth/register/cubit/register_view_model.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/cache/cache_helper.dart';
import '../../../../core/components/resuble_components.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styels.dart';
import '../../../../data/repository/user_data/data_source/auth_remote_data_source_impl.dart';
import 'cubit/register_states.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  XFile? _pickedImage;
  String? _selectedAvatar;
  bool _isPasswordObscured = true;
  bool _isConfirmPasswordObscured = true;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterViewModel(),
      child: BlocConsumer<RegisterViewModel, RegisterStates>(
        listener: (context, state) {
          if (state is RegisterSuccessState) {
            // Go to next page after successful registration
            _pageController.nextPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.ease,
            );
          } else if (state is RegisterErrorState) {
            // Show error dialog
            _showErrorDialog(context, state.error);
          }
        },
        builder: (context, state) {
          final viewModel = BlocProvider.of<RegisterViewModel>(context);
          return Scaffold(
            body: Stack(
              children: [
                SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 27.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(height: 70.h),
                        SvgPicture.asset(
                          AppImages.logoSvgLight,
                          semanticsLabel: 'logo',
                          height: 70.h,
                        ),
                        SizedBox(height: 20.h),
                        Text(
                          "create your account",
                          style: AppStyles.bold24primary,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 20.h),
                        _buildProgressIndicator(),
                        SizedBox(
                          height: 540.h,
                          child: PageView(
                            controller: _pageController,
                            physics: const NeverScrollableScrollPhysics(),
                            onPageChanged: (int page) {
                              setState(() {
                                _currentPage = page;
                              });
                            },
                            children: [
                              _buildPersonalDetailsPage(viewModel),
                              _buildImagePage(),
                              _buildBmiPage(),
                            ],
                          ),
                        ),
                        CustomElevatedButton(
                          text: _currentPage == 2 ? "Calculate" : "Next",
                          textStyle: AppStyles.regular18white,
                          onPressed: state is RegisterLoadingState
                              ? null
                              : () {
                                  if (_currentPage == 0) {
                                    // Call register function from cubit
                                    viewModel.register();
                                  } else if (_currentPage < 2) {
                                    _pageController.nextPage(
                                      duration:
                                          const Duration(milliseconds: 300),
                                      curve: Curves.ease,
                                    );
                                  } else {
                                    // Save the selected image or avatar
                                    if (_pickedImage != null) {
                                      CashHelper.saveData(
                                          key: "user_image",
                                          value: _pickedImage!.path);
                                    } else if (_selectedAvatar != null) {
                                      final avatarPath =
                                          _selectedAvatar == "Male"
                                              ? AppImages.boyAvatar
                                              : AppImages.girlAvatar;
                                      CashHelper.saveData(
                                          key: "user_image", value: avatarPath);
                                    }
                                    // Final step - navigate to gender screen
                                    Navigator.pushNamed(
                                        context, Routes.genderScreen);
                                  }
                                },
                        ),
                        SizedBox(height: 20.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Already have account ",
                              style: AppStyles.regular13black,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.pushReplacementNamed(
                                    context, Routes.loginScreen);
                              },
                              child: Text(
                                "Log in",
                                style: AppStyles.bold13primary,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20.h),
                      ],
                    ),
                  ),
                ),
                // Loading overlay
                if (state is RegisterLoadingState)
                  Container(
                    color: Colors.black.withOpacity(0.5),
                    child: Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primaryColor,
                      ),
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
            'Registration Error',
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

  Widget _buildProgressIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildProgressStep("personal Details", 0),
        _buildProgressStep("Image", 1),
        _buildProgressStep("BMI", 2),
      ],
    );
  }

  Widget _buildProgressStep(String title, int index) {
    bool isActive = _currentPage >= index;
    return Column(
      children: [
        Text(
          title,
          style:
              isActive ? AppStyles.regular13primary : AppStyles.regular13grey,
        ),
        SizedBox(height: 8.h),
        Container(
          height: 2.h,
          width: 100.w,
          color: isActive ? AppColors.primaryColor : AppColors.greyColor,
        ),
      ],
    );
  }

  Widget _buildPersonalDetailsPage(RegisterViewModel viewModel) {
    return Form(
      key: viewModel.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20.h),
          Text("Email", style: AppStyles.regular13grey),
          SizedBox(height: 8.h),
          CustomTextFormField(
            validator: AppValidators.validateEmail,
            hintText: "",
            controller: viewModel.emailController,
          ),
          SizedBox(height: 15.h),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("First Name", style: AppStyles.regular13grey),
                    SizedBox(height: 8.h),
                    CustomTextFormField(
                      validator: (value) => value!.isEmpty ? "Required" : null,
                      hintText: "",
                      controller: viewModel.firstNameController,
                    ),
                  ],
                ),
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Last Name", style: AppStyles.regular13grey),
                    SizedBox(height: 8.h),
                    CustomTextFormField(
                      validator: (value) => value!.isEmpty ? "Required" : null,
                      hintText: "",
                      controller: viewModel.lastNameController,
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 15.h),
          Text("Mobile Number", style: AppStyles.regular13grey),
          SizedBox(height: 8.h),
          CustomTextFormField(
            validator: AppValidators.validatePhoneNumber,
            hintText: "",
            controller: viewModel.phoneController,
          ),
          SizedBox(height: 15.h),
          Text("password", style: AppStyles.regular13grey),
          SizedBox(height: 8.h),
          CustomTextFormField(
            validator: AppValidators.validatePassword,
            hintText: "",
            isObscure: _isPasswordObscured,
            onSuffixPressed: () {
              setState(() {
                _isPasswordObscured = !_isPasswordObscured;
              });
            },
            suffixIcon:
                _isPasswordObscured ? Icons.visibility_off : Icons.visibility,
            controller: viewModel.passwordController,
          ),
          SizedBox(height: 15.h),
          Text("Confirm password", style: AppStyles.regular13grey),
          SizedBox(height: 8.h),
          CustomTextFormField(
            validator: (value) {
              if (value != viewModel.passwordController.text) {
                return "Passwords don't match";
              }
              return null;
            },
            hintText: "",
            isObscure: _isConfirmPasswordObscured,
            onSuffixPressed: () {
              setState(() {
                _isConfirmPasswordObscured = !_isConfirmPasswordObscured;
              });
            },
            suffixIcon: _isConfirmPasswordObscured
                ? Icons.visibility_off
                : Icons.visibility,
            controller: viewModel.confirmPasswordController,
          ),
        ],
      ),
    );
  }

  Future<void> _pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image != null) {
      setState(() {
        _pickedImage = image;
        _selectedAvatar = null;
      });
    }
  }

  void _selectAvatar(String avatar) {
    setState(() {
      _selectedAvatar = avatar;
      _pickedImage = null;
    });
  }

  Widget _buildImagePage() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 30.h),
        InkWell(
          onTap: _pickImage,
          child: Container(
            height: 150.h,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(12.r),
              image: _pickedImage != null
                  ? DecorationImage(
                      image: FileImage(File(_pickedImage!.path)),
                      fit: BoxFit.cover,
                    )
                  : null,
            ),
            child: _pickedImage == null
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.upload_file,
                          size: 40.sp, color: AppColors.primaryColor),
                      SizedBox(height: 10.h),
                      Text("Upload your photo",
                          style: AppStyles.regular16primary),
                    ],
                  )
                : null,
          ),
        ),
        SizedBox(height: 30.h),
        Text("Choose your Avatar", style: AppStyles.medium18black),
        SizedBox(height: 20.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildAvatar(AppImages.boyAvatar, "Male"),
            _buildAvatar(AppImages.girlAvatar, "Female"),
          ],
        )
      ],
    );
  }

  Widget _buildAvatar(String imagePath, String label) {
    final bool isSelected = _selectedAvatar == label;
    return InkWell(
      onTap: () => _selectAvatar(label),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 24.w),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryColor : Colors.grey[200],
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Column(
          children: [
            Image.asset(imagePath, height: 100.h),
            SizedBox(height: 10.h),
            Text(label,
                style: isSelected
                    ? AppStyles.medium16white
                    : AppStyles.medium16black),
          ],
        ),
      ),
    );
  }

  Widget _buildBmiPage() {
    return Column(
      children: [
        SizedBox(height: 30.h),
        Image.asset(AppImages.introBmi, height: 180.h),
        SizedBox(height: 20.h),
        Text("Calculate Your BMI", style: AppStyles.bold24black),
        SizedBox(height: 15.h),
        Text(
          "(Body Mass Index) is a measurement used to assess whether a person has a healthy body weight for their height. It is calculated by dividing a person's weight (in kilograms) by the square of their height (in CM)",
          textAlign: TextAlign.center,
          style: AppStyles.regular14grey,
        ),
      ],
    );
  }
}
