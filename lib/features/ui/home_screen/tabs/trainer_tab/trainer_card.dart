import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gym_app_graduation_project/config/routing/routes.dart';
import 'package:gym_app_graduation_project/core/utils/app_colors.dart';
import 'package:gym_app_graduation_project/core/utils/app_styels.dart'; // Add this package in pubspec.yaml

class TrainerCard extends StatelessWidget {
  const TrainerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, Routes.trainerDetailsPage);
      },
      child: Container(
        padding: EdgeInsets.only(left: 3.w, right: 3.w, top: 3.h),
        width: 200.w,
        height: 170.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: Color(0xffE7E7E7), width: 2),
          color: Colors.white,
          // boxShadow:[
          //   BoxShadow(
          //     color: AppColors.greyColor,
          //     blurRadius: 5,
          //     spreadRadius: 5,
          //     offset: Offset(-2,2 )
          //   )
          // ],
        ),
        child: Column(
          children: [
            Image.asset(
              "assets/images/trainer_image.png",
              width: 194.w,
              height: 110.h,
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: 15.h,
            ),
            Row(
              children: [
                SizedBox(
                  width: 5.w,
                ),
                Text(
                  "Fady Fouad",
                  style: AppStyles.regular18black,
                ),
                SizedBox(
                  width: 5.w,
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 15,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 15,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 15,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 15,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 15,
                        ),
                      ],
                    ),
                    Text(
                      "(150 Review)",
                      style: GoogleFonts.poppins(
                        color: AppColors.greyTextColor,
                        fontSize: 10.sp,
                      ),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
