import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gym_app_graduation_project/config/routing/routes.dart';
import 'package:gym_app_graduation_project/core/utils/app_colors.dart';
import 'package:gym_app_graduation_project/core/utils/app_styels.dart'; // Add this package in pubspec.yaml
import 'package:gym_app_graduation_project/core/utils/trainer_model.dart';

class TrainerCard extends StatelessWidget {
  final Trainer trainer;

  const TrainerCard({super.key, required this.trainer});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, Routes.trainerDetailsPage,
            arguments: trainer);
      },
      child: Container(
        padding: EdgeInsets.only(left: 3.w, right: 3.w, top: 3.h),
        width: 200.w,
        height: 170.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: Color(0xffE7E7E7), width: 2),
          color: Colors.white,
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.r),
              child: Image.asset(
                trainer.imagePath,
                width: 194.w,
                height: 110.h,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            Row(
              children: [
                SizedBox(
                  width: 5.w,
                ),
                Expanded(
                  child: Text(
                    trainer.name,
                    style: AppStyles.regular18black,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(
                  width: 5.w,
                ),
                Column(
                  children: [
                    Row(
                      children: List.generate(5, (index) {
                        return Icon(
                          Icons.star,
                          color: index < trainer.rating.floor()
                              ? Colors.yellow
                              : Colors.grey[300],
                          size: 15,
                        );
                      }),
                    ),
                    Text(
                      "(${trainer.reviews} Review)",
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
