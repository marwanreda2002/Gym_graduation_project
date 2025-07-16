import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gym_app_graduation_project/config/routing/routes.dart';
import 'package:gym_app_graduation_project/core/components/resuble_components.dart';
import 'package:gym_app_graduation_project/core/utils/app_colors.dart';
import 'package:gym_app_graduation_project/core/utils/app_styels.dart';
import 'package:gym_app_graduation_project/core/utils/toast.dart';
import 'package:gym_app_graduation_project/core/cache/cache_helper.dart';

class UpdateProfile extends StatefulWidget {
  const UpdateProfile({super.key});

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _mobileController = TextEditingController();
  final _emailController = TextEditingController();
  final _birthdayController = TextEditingController();
  String? _gender;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  void _loadUserData() {
    final fullName = CashHelper.getData(key: 'name')?.toString() ?? '';
    final nameParts = fullName.split(' ');
    _firstNameController.text = nameParts.isNotEmpty ? nameParts.first : '';
    _lastNameController.text =
        nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '';
    _mobileController.text = CashHelper.getData(key: 'phone')?.toString() ?? '';
    _emailController.text = CashHelper.getData(key: 'email')?.toString() ?? '';
    _birthdayController.text = ''; // Birthday is not in cache
    _gender = null; // Gender is not in cache
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _mobileController.dispose();
    _emailController.dispose();
    _birthdayController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: CustomBackButtonCircle(),
        centerTitle: true,
        title: Text(
          'Your Profile',
          style: AppStyles.medium20black,
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 30.h),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    const CircleAvatar(
                      radius: 60,
                      backgroundImage: AssetImage(
                          'assets/images/profile_image.png'), // Replace with your asset or network image
                    ),
                    Positioned(
                      bottom: 0,
                      right: 4,
                      child: CircleAvatar(
                        backgroundColor: AppColors.primaryColor,
                        radius: 16,
                        child: Icon(Icons.edit, size: 18, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 47.h),
              Row(
                children: [
                  Expanded(
                      child:
                          _buildTextField("First Name", _firstNameController)),
                  const SizedBox(width: 10),
                  Expanded(
                      child: _buildTextField("Last Name", _lastNameController)),
                ],
              ),
              SizedBox(height: 29.h),
              Row(
                children: [
                  Expanded(
                      child:
                          _buildTextField("Mobile Number", _mobileController)),
                ],
              ),
              SizedBox(height: 29.h),
              _buildTextField("Email", _emailController),
              SizedBox(height: 29.h),
              SizedBox(height: 150.h),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6.r)),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Save the updated data
                    final newName =
                        '${_firstNameController.text} ${_lastNameController.text}';
                    CashHelper.saveData(key: 'name', value: newName);
                    CashHelper.saveData(
                        key: 'phone', value: _mobileController.text);
                    CashHelper.saveData(
                        key: 'email', value: _emailController.text);

                    ToastMessage.toastMsg("Profile updated successfully",
                        Colors.white, AppColors.primaryColor);
                    Navigator.pushReplacementNamed(context, Routes.homeScreen);
                  }
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 19.0.h),
                  child: Text(
                    "Update your profile",
                    style: AppStyles.regular18white,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  static Widget _buildTextField(String hint, TextEditingController controller) {
    return TextFormField(
      controller: controller,
      cursorColor: AppColors.primaryColor,
      decoration: _inputDecoration(hint),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your $hint';
        }
        return null;
      },
    );
  }

  static InputDecoration _inputDecoration(String hint) {
    return InputDecoration(
      labelText: hint,
      labelStyle: AppStyles.regular16grey,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(7.r)),
      ),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xff6F6F6F)),
          borderRadius: BorderRadius.all(Radius.circular(7.r))),
    );
  }
}
