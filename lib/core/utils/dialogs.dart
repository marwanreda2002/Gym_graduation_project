import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gym_app_graduation_project/core/cache/cache_helper.dart';

import '../../config/routing/routes.dart';
import 'app_colors.dart';
import 'app_styels.dart';


class CustomDialog {
  static void showLoading(
      {required BuildContext context,
        required String message,}) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: AppColors.greyColor,
            content: Row(
              children: [
                CircularProgressIndicator(
                  color: AppColors.primaryColor,
                ),
                SizedBox(
                  width: 15,
                ),
                Text(
                  message,
                  style: AppStyles.regular16black,
                )
              ],
            ),
          );
        });
  }

  static void hideLoading(BuildContext context) {
    Navigator.pop(context);
  }

  static void showAlert({
    required BuildContext context,
    required String message,
    String title = '',
    String? posActionName,
    Function? posAction,
    String? negActionName,
    Function? negAction,
  }) {
    List<Widget> actions = [];
    if (posActionName != null) {
      actions.add(TextButton(
          onPressed: () {
            Navigator.pop(context);
            posAction?.call();
          },
          child: Text(
            posActionName,
            style: AppStyles.bold13primary,
          )));
    }
    if (negActionName != null) {
      actions.add(TextButton(
          onPressed: () {
            Navigator.pop(context);
            negAction?.call();
          },
          child: Text(
            negActionName,
            style: AppStyles.bold13primary,
          )));
    }
    showDialog(
        barrierDismissible: true,
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: AppColors.whiteColor,
            title: Center(
              child: Text(
                title,
                style: AppStyles.regular17red,
              ),
            ),
            content: Text(
              message,
              style:
                  AppStyles.regular16black.copyWith(color: Color(0xff666666)),
            ),
            actions: actions,
          );
        });
  }

  static void showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        actionsPadding: EdgeInsets.only(left: 20.w, bottom: 18.h, top: 35.h),
        buttonPadding: EdgeInsets.only(left: 150.w),
        titlePadding: EdgeInsets.only(bottom: 35.h, top: 14.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.r),
        ),
        title: Center(
          child: Text("log out", style: AppStyles.regular17red),
        ),
        content: Text(
          "Are you sure you want to log out?",
          textAlign: TextAlign.center,
          style: AppStyles.regular16black.copyWith(color: Color(0xff666666)),
        ),
        actionsAlignment: MainAxisAlignment.center,
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
            },
            child: Text(
              "Cancel",
              style: AppStyles.regular14grey.copyWith(color: Colors.black),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // Add your logout logic here
              Navigator.of(ctx).pop(); // Close the dialog
              CashHelper.clearAllData();
              Navigator.pushReplacementNamed(context, Routes.loginScreen);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(7.r),
              ),
            ),
            child: Text(
              "Yes, Log out",
              style: AppStyles.regular14white,
            ),
          ),
        ],
      ),
    );
  }
}
