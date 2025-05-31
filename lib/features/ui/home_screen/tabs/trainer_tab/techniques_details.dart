import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/components/resuble_components.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styels.dart';

class TechniquesDetails extends StatelessWidget {
  const TechniquesDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: CustomBackButtonCircle(),
        title: Text(
          'Chest exercise',
          style: AppStyles.medium18black,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    "assets/images/chest_exercise_image.png",
                    width: double.infinity,
                  ),
                  Center(
                      child: ImageIcon(
                    size: 50,
                    AssetImage("assets/images/play_icon.png"),
                    color: AppColors.primaryColor,
                  )),
                  Positioned(
                      bottom: 8.h,
                      left: 12.w,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 3.w, vertical: 1.h),
                        decoration: BoxDecoration(
                          color: Color(0xbd4e4e4e),
                          borderRadius: BorderRadius.circular(5.r),
                        ),
                        child: Text(
                          "30:00",
                          style: AppStyles.regular14white,
                        ),
                      ))
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 12.h,
                    ),
                    Text(
                      "Video 1",
                      style: AppStyles.regular24black,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      "Lorem ipsum dolor sit amet consectetur. Ipsum elit a "
                      "volutpat turpis tincidunt",
                      style: AppStyles.regular16grey.copyWith(
                        color: Color(0xff4c4c4c),
                      ),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    ExerciseWidget(),
                    ExerciseWidget(),
                    ExerciseWidget(),
                    ExerciseWidget(),
                    ExerciseWidget(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ExerciseWidget extends StatelessWidget {
  const ExerciseWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  "assets/images/technique2.png",
                ),
                ImageIcon(
                  size: 16,
                  AssetImage("assets/images/play_icon.png"),
                  color: AppColors.primaryColor,
                ),
                Positioned(
                    bottom: 8.h,
                    left: 12.w,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xbd4e4e4e),
                        borderRadius: BorderRadius.circular(5.r),
                      ),
                      child: Text(
                        "30:00",
                        style: AppStyles.regular14white,
                      ),
                    ))
              ],
            ),
            SizedBox(
              width: 8.w,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Video 1",
                    style: AppStyles.regular16black,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    "Lorem ipsum dolor sit amet consectetur. Ipsum elit a "
                    "volutpat turpis tincidunt",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                    style: AppStyles.regular14grey.copyWith(
                      color: Color(0xff6F6F6F),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        SizedBox(
          height: 26.h,
        )
      ],
    );
  }
}
