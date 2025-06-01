import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gym_app_graduation_project/config/routing/routes.dart';
import 'package:gym_app_graduation_project/core/utils/app_colors.dart';
import 'package:gym_app_graduation_project/core/utils/app_styels.dart';
import 'package:gym_app_graduation_project/core/utils/dialogs.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 20.h),
            Center(
              child: Text(
                'Profile',
                style: AppStyles.medium20black,
              ),
            ),
            SizedBox(height: 20.h),
            CircleAvatar(
                radius: 80,
                backgroundImage: AssetImage("assets/images/profile_image.png")),
            SizedBox(height: 10.h),
            Text(
              "Mohamed El Barawy",
              style: AppStyles.medium18primary,
            ),
            SizedBox(height: 5.h),
            Text("Mohamed902@gmail.com",
                style:
                    AppStyles.regular13grey.copyWith(color: Color(0xff666666))),
            SizedBox(height: 5.h),
            Text("01018057488",
                style:
                    AppStyles.regular13grey.copyWith(color: Color(0xff666666))),
            SizedBox(height: 30.h),
            ListTile(
              leading: ImageIcon(
                AssetImage("assets/images/update_profile_icon.png"),
                color: AppColors.primaryColor,
              ),
              title: Text(
                "Update profile",
                style: AppStyles.light17Black,
              ),
              onTap: () {
                Navigator.pushNamed(context, Routes.updateProfileScreen);
              },
            ),
            SizedBox(
              height: 20.h,
            ),
            ListTile(
              leading: ImageIcon(
                AssetImage("assets/images/help_center_icon.png"),
                color: AppColors.primaryColor,
              ),
              title: Text(
                "Help center",
                style: AppStyles.light17Black,
              ),
              onTap: () {},
            ),
            SizedBox(
              height: 20.h,
            ),
            ListTile(
              leading: ImageIcon(
                AssetImage("assets/images/privacy_icon.png"),
                color: AppColors.primaryColor,
              ),
              title: Text(
                "Privacy policy",
                style: AppStyles.light17Black,
              ),
              onTap: () {},
            ),
            SizedBox(
              height: 20.h,
            ),
            ListTile(
              leading: ImageIcon(
                AssetImage("assets/images/password_manager_icon.png"),
                color: AppColors.primaryColor,
              ),
              title: Text(
                "Password manager",
                style: AppStyles.light17Black,
              ),
              onTap: () {
                Navigator.pushNamed(context, Routes.passwordManagerScreen);
              },
            ),
            Spacer(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: SizedBox(
                width: 177.w,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6.r)),
                    padding: EdgeInsets.symmetric(vertical: 14.h),
                  ),
                  onPressed: () {
                    CustomDialog.showLogoutDialog(context);
                  },
                  child: Text(
                    "Log out",
                    style: AppStyles.light17white,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
