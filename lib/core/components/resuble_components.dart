import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gym_app_graduation_project/core/utils/app_colors.dart';
import 'package:gym_app_graduation_project/core/utils/app_styels.dart';

import '../utils/app_images.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomElevatedButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 362.w,
      height: 64.h,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(7.r),
          ),
        ),
        onPressed: onPressed,
        child: Text(text, style: AppStyles.regular24black),
      ),
    );
  }
}

class CustomBackButtonCircle extends StatelessWidget {
  const CustomBackButtonCircle({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: ImageIcon(
          AssetImage(AppImages.backArrowLight),
          color: AppColors.primaryColor,
          size: 32.sp,
        ));
  }
}

class CustomLinearProgress extends StatelessWidget {
  final double value;

  const CustomLinearProgress({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      value: value,
      color: AppColors.primaryColor,
      backgroundColor: AppColors.greyColor,
      minHeight: 14.h,
      borderRadius: BorderRadius.circular(6.r),
    );
  }
}
