import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gym_app_graduation_project/core/utils/app_colors.dart';

class AppStyles {
  static TextStyle bold36Black = GoogleFonts.jost(
      color: Colors.black, fontSize: 36.sp, fontWeight: FontWeight.bold);
  static TextStyle bold36Primary = GoogleFonts.jost(
      color: AppColors.primaryColor, fontSize: 36.sp, fontWeight: FontWeight.bold);
  static TextStyle bold16Black = GoogleFonts.jost(
      color: AppColors.blackColor, fontSize: 16.sp, fontWeight: FontWeight.bold);
  static TextStyle bold18Primary = GoogleFonts.jost(
    color: AppColors.primaryColor,
    fontSize: 18.sp,
  );
  static TextStyle regular20black = GoogleFonts.jost(
    color: AppColors.blackColor,
    fontWeight: FontWeight.w400,
    fontSize: 20.sp,
  );
  static TextStyle regular24black = GoogleFonts.jost(
    fontWeight: FontWeight.w400,
    color: AppColors.blackColor,
    fontSize: 24.sp,
  );
  static TextStyle regular24Primary = GoogleFonts.jost(
    fontWeight: FontWeight.w400,
    color: AppColors.primaryColor,
    fontSize: 24.sp,
  );
  static TextStyle bold24black = GoogleFonts.jost(
    color: AppColors.blackColor,
    fontWeight: FontWeight.bold,
    fontSize: 24,);
  static TextStyle regular15grey = GoogleFonts.jost(
    color: AppColors.greyTextColor,
    fontSize: 15,);
  static TextStyle regular16black = GoogleFonts.jost(
    color: AppColors.blackColor,
    fontWeight: FontWeight.w400,
    fontSize: 16.sp,
  );
  static TextStyle regular16primary = GoogleFonts.jost(
    color: AppColors.primaryColor,
    fontSize: 16,);
  static TextStyle regular10black = GoogleFonts.jost(
    color: AppColors.blackColor,
    fontWeight: FontWeight.w400,
    fontSize: 15.sp,
  );
  static TextStyle regular80primary = GoogleFonts.jost(
    color: AppColors.primaryColor,
    fontWeight: FontWeight.w400,
    fontSize: 80.sp,
  );

  static TextStyle regular13primary = GoogleFonts.jost(
    color: AppColors.primaryColor,
    fontSize: 13,);
  static TextStyle bold13primary = GoogleFonts.jost(
    color: AppColors.primaryColor,
    fontWeight: FontWeight.bold,
    fontSize: 13,);
  static TextStyle regular13black= GoogleFonts.jost(
    color: AppColors.blackColor,
    fontSize: 13,);
}