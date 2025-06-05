import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gym_app_graduation_project/config/routing/routes.dart';
import 'package:gym_app_graduation_project/core/utils/cache_helper.dart';

import '../../../core/components/resuble_components.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_styels.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    double bmi =
        args["weight"] / ((args["height"] / 100) * (args["height"] / 100));
    String result;
    if (bmi < 18.5) {
      result = "Underweight";
    } else if (bmi < 25) {
      result = "Normal";
    } else if (bmi < 30) {
      result = "Overweight";
    } else if (bmi < 35) {
      result = "Obese";
    } else {
      result = "Extremely Obese";
    }
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 40.h),
            Align(
                alignment: Alignment.topLeft, child: CustomBackButtonCircle()),
            SizedBox(height: 20.h),
            Text("My Dashboard",
                style: AppStyles.bold36Black, textAlign: TextAlign.center),
            SizedBox(height: 50.h),
            infoRow(Icons.cake, "Age", args["age"].toString()),
            infoRow(Icons.male, "Gender", args["gender"]),
            infoRow(Icons.height, "Height", args["height"].toString()),
            infoRow(Icons.monitor_weight, "Weight", args["weight"].toString()),
            SizedBox(height: 50.h),
            Center(
              child: Text("Your body mass index (BMI) is",
                  style: AppStyles.regular20black),
            ),
            SizedBox(height: 26.h),
            Center(
              child: Text(bmi.toStringAsFixed(1),
                  style:
                      TextStyle(fontSize: 32.sp, fontWeight: FontWeight.bold)),
            ),
            SizedBox(height: 39.h),
            Center(
              child: Text("Your BMI shows that you are $result",
                  style: AppStyles.regular16black),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 35.h),
              child: _bmiIndicator(bmi),
            ),
            Spacer(),
            CustomElevatedButton(
              text: CacheHelper.getData(key: "isHome") == null
                  ? "Calculate Again"
                  : "Get Started",
              textStyle: AppStyles.regular18white,
              onPressed: () {
                CacheHelper.getData(key: "isHome") == null
                    ? Navigator.pushNamed(context, Routes.introBmiScreen)
                    : Navigator.pushNamed(context, Routes.homeScreen);
              },
            ),
            SizedBox(
              height: 48.h,
            )
          ],
        ),
      ),
    );
  }

  Widget infoRow(IconData icon, String title, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Title
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                title,
                style: AppStyles.regular20black,
              ),
            ),
          ),

          // Icon
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: Icon(
              icon,
              color: AppColors.primaryColor,
              size: 40.sp,
            ),
          ),

          // Value
          Expanded(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                value,
                style: AppStyles.regular20black,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _bmiIndicator(double bmi) {
    return Column(
      children: [
        SizedBox(
          width: 350.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              Text("18.5", style: TextStyle(fontSize: 15)),
              Text("25", style: TextStyle(fontSize: 15)),
              Text("30", style: TextStyle(fontSize: 15)),
              Text("35", style: TextStyle(fontSize: 15)),
            ],
          ),
        ),
        Stack(
          children: [
            Row(
              children: [
                Expanded(
                    child: Container(
                  height: 15.h,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(16.r),
                          topLeft: Radius.circular(16.r))),
                )),
                // Under
                Expanded(child: Container(height: 15.h, color: Colors.green)),
                // Normal
                Expanded(child: Container(height: 15.h, color: Colors.yellow)),
                // Over
                Expanded(child: Container(height: 15.h, color: Colors.orange)),
                // Obese
                Expanded(
                    child: Container(
                  height: 15.h,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(16.r),
                          topRight: Radius.circular(16.r))),
                )),
                // Extremely
              ],
            ),
            Positioned(
              left: ((bmi - 10) / 30) * 300.w,
              top: 0,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(5.r)),
                padding: EdgeInsets.all(2.sp),
                child: Icon(Icons.circle,
                    color: AppColors.primaryColor, size: 10.sp),
              ),
            ),
          ],
        ),
        SizedBox(height: 6.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text("Under", style: TextStyle(fontSize: 15)),
            Text("Normal", style: TextStyle(fontSize: 15)),
            Text("Over", style: TextStyle(fontSize: 15)),
            Text("Obese", style: TextStyle(fontSize: 15)),
            Text("Extremely", style: TextStyle(fontSize: 15)),
          ],
        )
      ],
    );
  }
}
