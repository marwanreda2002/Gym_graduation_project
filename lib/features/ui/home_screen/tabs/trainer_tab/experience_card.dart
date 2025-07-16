import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gym_app_graduation_project/core/utils/trainer_model.dart';
import 'package:gym_app_graduation_project/core/utils/app_colors.dart';
import 'package:gym_app_graduation_project/core/utils/app_styels.dart';

class ExperienceCard extends StatelessWidget {
  final WorkExperience workExperience;

  const ExperienceCard({
    super.key,
    required this.workExperience,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: EdgeInsets.only(bottom: 12.h),
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Logo
            Image.asset(
              'assets/images/golds_gym_image.png',
              width: 40.w,
              height: 40.h,
              fit: BoxFit.cover,
            ),
            SizedBox(width: 12.w),
            // Text and bullets
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    workExperience.position,
                    style: AppStyles.medium16black,
                  ),
                  Text(
                    workExperience.company,
                    style: AppStyles.regular16primary,
                  ),
                  Text(
                    workExperience.duration,
                    style: TextStyle(color: Colors.grey, fontSize: 12.sp),
                  ),
                  SizedBox(height: 12.h),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: workExperience.achievements
                        .map((achievement) => Padding(
                              padding: EdgeInsets.symmetric(vertical: 4.h),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(Icons.fiber_manual_record,
                                      size: 8, color: AppColors.primaryColor),
                                  SizedBox(width: 8.w),
                                  Expanded(
                                    child: Text(
                                      achievement,
                                      style: AppStyles.regular14Black,
                                    ),
                                  ),
                                ],
                              ),
                            ))
                        .toList(),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
