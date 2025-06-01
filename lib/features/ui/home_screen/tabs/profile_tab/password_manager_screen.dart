import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gym_app_graduation_project/core/components/resuble_components.dart';
import 'package:gym_app_graduation_project/core/utils/app_colors.dart';
import 'package:gym_app_graduation_project/core/utils/app_styels.dart';

import '../../../../../core/utils/toast.dart';

class PasswordManagerScreen extends StatefulWidget {
  const PasswordManagerScreen({super.key});

  @override
  State<PasswordManagerScreen> createState() => _PasswordManagerScreenState();
}

class _PasswordManagerScreenState extends State<PasswordManagerScreen> {
  bool _isObscureCurrent = true;
  bool _isObscureNew = true;
  bool _isObscureConfirm = true;

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
          'Password Manager',
          style: AppStyles.medium20black,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 75.h, left: 24.w, right: 24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildPasswordField(
              label: 'Current password',
              obscure: _isObscureCurrent,
              toggle: () =>
                  setState(() => _isObscureCurrent = !_isObscureCurrent),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  // Navigate to reset password
                },
                child: Text("forgot your password?",
                    style: TextStyle(
                        color: AppColors.primaryColor,
                        decoration: TextDecoration.underline,
                        decorationColor: AppColors.primaryColor)),
              ),
            ),
            SizedBox(height: 20.h),
            _buildPasswordField(
              label: 'New password',
              obscure: _isObscureNew,
              toggle: () => setState(() => _isObscureNew = !_isObscureNew),
            ),
            SizedBox(height: 29.h),
            _buildPasswordField(
              label: 'Confirm password',
              obscure: _isObscureConfirm,
              toggle: () =>
                  setState(() => _isObscureConfirm = !_isObscureConfirm),
            ),
            SizedBox(height: 334.h),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
              ),
              onPressed: () {
                ToastMessage.toastMsg(
                    "changed", Colors.white, AppColors.primaryColor);
                Navigator.pop(context);
              },
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 19.0.h),
                child: Text(
                  "Change Password",
                  style: AppStyles.regular18white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildPasswordField({
    required String label,
    required bool obscure,
    required VoidCallback toggle,
  }) {
    return TextFormField(
      obscureText: obscure,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: AppStyles.regular16grey,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(7.r)),
        suffixIcon: IconButton(
          icon: Icon(obscure ? Icons.visibility_off : Icons.visibility),
          onPressed: toggle,
        ),
      ),
    );
  }
}
