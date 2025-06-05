import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gym_app_graduation_project/config/routing/routes.dart';
import 'package:gym_app_graduation_project/core/utils/app_colors.dart';
import 'package:gym_app_graduation_project/core/utils/app_images.dart';
import 'package:gym_app_graduation_project/core/utils/app_styels.dart';

import '../../../core/components/resuble_components.dart';
import '../../../core/utils/cache_helper.dart';

enum Gender { male, female }

class GenderScreen extends StatefulWidget {
  const GenderScreen({super.key});

  @override
  State<GenderScreen> createState() => _GenderScreenState();
}

class _GenderScreenState extends State<GenderScreen> {
  Gender? selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: CustomBackButtonCircle()),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 10.h),
            Image.asset(
              AppImages.logoLight,
              height: 30.h,
              width: 67.w,
            ),
            // Replace if needed
            SizedBox(height: 40.h),
            Center(
              child: Text("whats  is your gender?",
                  style: AppStyles.regular20black),
            ),
            SizedBox(height: 64.h),

            // Male Card
            GenderOption(
              label: "Male",
              icon: Icons.male,
              selected: selectedGender == Gender.male,
              onTap: () => setState(() => selectedGender = Gender.male),
            ),
            SizedBox(height: 20.h),

            // Female Card
            GenderOption(
              label: "Female",
              icon: Icons.female,
              selected: selectedGender == Gender.female,
              onTap: () => setState(() => selectedGender = Gender.female),
            ),
            const Spacer(),

            // Progress Bar
            CustomLinearProgress(
              value: 1 / 6,
            ),
            SizedBox(height: 16.h),

            // Continue Button
            CustomElevatedButton(
              text: "Continue",
              onPressed: () {
                if (selectedGender != null) {
                  Navigator.pushNamed(context, Routes.heightScreen,
                      arguments: {"gender": selectedGender});
                  CacheHelper.saveData(
                      key: "gender",
                      value: selectedGender.toString().split(".").last);
                  // Navigate or save data
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Please select a gender"),
                    ),
                  );
                }
              },
            ),
            SizedBox(height: 24.h),
          ],
        ),
      ),
    );
  }
}

class GenderOption extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool selected;
  final VoidCallback onTap;

  const GenderOption({
    super.key,
    required this.label,
    required this.icon,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 211.h,
        decoration: BoxDecoration(
          border: Border.all(
            color: selected ? AppColors.primaryColor : AppColors.blackColor,
            width: selected ? 3 : 1,
          ),
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 50.sp, color: AppColors.primaryColor),
              SizedBox(height: 6.h),
              Text(label, style: AppStyles.regular20black),
            ],
          ),
        ),
      ),
    );
  }
}
