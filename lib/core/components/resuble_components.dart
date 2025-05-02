import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gym_app_graduation_project/core/utils/app_colors.dart';
import 'package:gym_app_graduation_project/core/utils/app_styels.dart';

import '../utils/app_images.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final TextStyle? textStyle;
  final VoidCallback onPressed;

  const CustomElevatedButton({
    super.key,
    required this.text,
    required this.onPressed, this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 20.w),
        backgroundColor: AppColors.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.r),
        ),
      ),
      onPressed: onPressed,
      child: Text(text, style:textStyle?? AppStyles.regular24black),
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
