import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gym_app_graduation_project/core/components/resuble_components.dart';
import 'package:gym_app_graduation_project/core/utils/app_colors.dart';
import 'package:gym_app_graduation_project/core/utils/app_styels.dart';
import 'package:gym_app_graduation_project/core/utils/toast.dart';

class UpdateProfile extends StatelessWidget {
  const UpdateProfile({super.key});

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
                Expanded(child: _buildTextField("First Name")),
                const SizedBox(width: 10),
                Expanded(child: _buildTextField("Last Name")),
              ],
            ),
            SizedBox(height: 29.h),
            Row(
              children: [
                Expanded(child: _buildTextField("Mobile Number")),
                const SizedBox(width: 10),
                TextButton(
                  onPressed: () {},
                  child: const Text("change",
                      style: TextStyle(color: Colors.blue)),
                )
              ],
            ),
            SizedBox(height: 29.h),
            _buildTextField("Email"),
            SizedBox(height: 29.h),
            _buildTextField("your Birthday"),
            SizedBox(height: 29.h),
            DropdownButtonFormField<String>(
              decoration: _inputDecoration("Gender"),
              items: ['Male', 'Female']
                  .map((gender) =>
                      DropdownMenuItem(value: gender, child: Text(gender)))
                  .toList(),
              onChanged: (value) {},
            ),
            SizedBox(height: 150.h),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6.r)),
              ),
              onPressed: () {
                // Todo: validation
                ToastMessage.toastMsg(
                    "changed", Colors.white, AppColors.primaryColor);
                // TODO: clear the text fields
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
    );
  }

  static Widget _buildTextField(String hint) {
    return TextFormField(
      cursorColor: AppColors.primaryColor,
      decoration: _inputDecoration(hint),
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
