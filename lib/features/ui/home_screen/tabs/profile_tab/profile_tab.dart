import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gym_app_graduation_project/config/routing/routes.dart';
import 'package:gym_app_graduation_project/core/cache/cache_helper.dart';
import 'package:gym_app_graduation_project/core/utils/app_colors.dart';
import 'package:gym_app_graduation_project/core/utils/app_styels.dart';
import 'package:gym_app_graduation_project/core/utils/dialogs.dart';

import '../../../../../core/utils/cache_helper.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  String? _imagePath;

  @override
  // void initState() {
  //   super.initState();
  //   _loadUserImage();
  // }

  // void _loadUserImage() {
  //   final path = CashHelper.getData(key: 'user_image');
  //   if (path != null && path is String) {
  //     setState(() {
  //       _imagePath = path;
  //     });
  //   }
  // }

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
            _buildProfileImage(),
            SizedBox(height: 10.h),
            Text(
              CacheHelper.getData(key: 'name'),
              style: AppStyles.medium18primary,
            ),
            SizedBox(height: 5.h),
            Text(CacheHelper.getData(key: 'email'),
                style:
                    AppStyles.regular13grey.copyWith(color: Color(0xff666666))),
            SizedBox(height: 5.h),
            Text(CacheHelper.getData(key: 'phone'),
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

  Widget _buildProfileImage() {
    return const CircleAvatar(
      radius: 80,
      backgroundImage: AssetImage("assets/images/profile_image.png"),
    );
  }
}
