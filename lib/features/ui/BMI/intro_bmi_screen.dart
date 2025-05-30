import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gym_app_graduation_project/config/routing/routes.dart';
import 'package:gym_app_graduation_project/core/components/resuble_components.dart';
import 'package:gym_app_graduation_project/core/utils/app_colors.dart';
import 'package:gym_app_graduation_project/core/utils/app_styels.dart';

class IntroBmiScreen extends StatelessWidget {
  const IntroBmiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: AppColors.primaryColor,
            child: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(

          children: [
            Image.asset(
              'assets/images/logo.png',
            ),
            // Replace with your actual asset

            SizedBox(height: 65.h),
            Image.asset('assets/images/intro_bmi.png', height: 310.h),
            // Replace with your actual asset
            SizedBox(height: 43.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Calculate Your', style: AppStyles.bold36Black),
                SizedBox(
                  width: 12.w,
                ),
                Text(
                  "BMI",
                  style: AppStyles.bold36Primary,
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              '(Body Mass Index) is a measurement used to assess whether a person has '
              'a healthy body weight for their height. It is calculated '
              'by dividing a person\'s weight (in kilograms) by the square '
              'of their height (in CM)',
              textAlign: TextAlign.center,
              style: AppStyles.regular16black,
            ),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CustomElevatedButton(
                    text: "Calculate",
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.genderScreen);
                    }),
              ],
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
