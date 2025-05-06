import 'package:flutter/material.dart';

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
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: AppColors.greyColor,
            title: Text(
              title,
              style: AppStyles.bold18Primary,
            ),
            content: Text(
              message,
              style: AppStyles.regular16black,
            ),
            actions: actions,
          );
        });
  }
}
