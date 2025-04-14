import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gym_app_graduation_project/core/utils/app_colors.dart';

class AppStyles {
  static TextStyle bold36Black = GoogleFonts.jost(
      color: Colors.black, fontSize: 36, fontWeight: FontWeight.bold);
  static TextStyle bold36Primary = GoogleFonts.jost(
      color: AppColors.primaryColor, fontSize: 36, fontWeight: FontWeight.bold);
  static TextStyle bold16Black = GoogleFonts.jost(
      color: AppColors.blackColor, fontSize: 16, fontWeight: FontWeight.bold);
  static TextStyle bold18Primary = GoogleFonts.jost(
    color: AppColors.primaryColor,
    fontSize: 18,
  );
  static TextStyle regular20black = GoogleFonts.jost(
    color: AppColors.blackColor,
    fontSize: 20,
  );
  static TextStyle regular24black = GoogleFonts.jost(
    color: AppColors.blackColor,
    fontSize: 24,
  );
  static TextStyle regular16black = GoogleFonts.jost(
    color: AppColors.blackColor,
    fontSize: 16,
  );
  static TextStyle regular10black = GoogleFonts.jost(
    color: AppColors.blackColor,
    fontSize: 15,
  );
  static TextStyle regular80primary = GoogleFonts.jost(
    color: AppColors.primaryColor,
    fontSize: 80,
  );
}